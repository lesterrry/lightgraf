# Handcrafted by Aydar N.
# 2023
#
# me@aydar.media
#

# frozen_string_literal: true

require 'lightgraf/fixtures'
require 'cgi'

module Lightgraf

	# Main internal parser
	module Internal
		include Fixtures

		def self.fix(
			text,
			format: :plaintext,
			disable_quotes: false,
			disable_hyphens: false,
			disable_nbsp: false,
			disable_nobr: false,
			disable_escape: false,
			lang_check_max_take: 5,
			nbsp_max_length: 3
		)
			raise TypeError unless text.is_a? String

			text = CGI.unescape_html text
			fixed = ''
			inside = []
			quote_char = []
			quote_lang = []
			last_space = nil
			last_hyphen = nil
			need_nobr_r = false
			offset = 0
			(0..text.length - 1).each do |i|
				char = text[i]
				if char == TAG_L
					inside << :tag
					fixed += TAG_L
					next
				elsif char == TAG_R
					inside.pop if inside.last == :tag
					fixed += TAG_R
					next
				elsif inside.last == :tag
					fixed += char
					next
				elsif !disable_escape and format == :html and char == AMPERSAND
					fixed += HTML_AMPERSAND
					next
				elsif [QUOT_RU_A_L, QUOT_EN_A_L].include?(char)
					inside << :quote_a
				elsif [QUOT_RU_A_R, QUOT_EN_A_R].include?(char)
					inside.pop if inside.last == :quote_a
				elsif SPACES.include?(char)
					if last_space == i - 1
						last_space = i
						next
					end
					need_next = false
					if !disable_nbsp and (i < nbsp_max_length or (!last_space.nil? and last_hyphen != i - 1 and (i - last_space) <= nbsp_max_length) or HYPHENS.include?(text[i + 1]))
						ins = case format; when :html then HTML_NBSP; when :plaintext then NBSP; end
						fixed += ins
						offset += ins.length - 1
						need_next = true
					end
					if need_nobr_r
						fixed += HTML_NOBR_R
						need_nobr_r = false
					end
					last_space = i
					next if need_next
					fixed += SPACE
					next
				elsif HYPHENS.include?(char)
					need_next = false
					if !disable_hyphens and (i.zero? or last_space == i - 1)
							ins = case format; when :html then HTML_HYPHEN; when :plaintext then HYPHEN; end
							fixed += ins
							offset += ins.length - 1
							need_next = true
					elsif format == :html and !disable_nobr and !need_nobr_r and last_space != i - 1 and !whitespace?(text[i + 1])
						fixed.insert (last_space.nil? ? 0 : last_space + offset + 1), HTML_NOBR_L
						need_nobr_r = true
					end
					last_hyphen = i
					next if need_next
				elsif !disable_quotes and INCORRECT_QUOTES.include?(char)
					case inside.last
					when :quote_a
						if char == quote_char.last
							fixed += case format; when :html then (quote_lang.last == :ru ? HTML_QUOT_RU_A_R : HTML_QUOT_EN_A_R); when :plaintext then (quote_lang.last == :ru ? QUOT_RU_A_R : QUOT_EN_A_R); end
							inside.pop
							quote_char.pop
							quote_lang.pop
						else
							quote_lang << (cyrillic?(text[i, lang_check_max_take]) ? :ru : :en)
							fixed += case format; when :html then (quote_lang.last == :ru ? HTML_QUOT_RU_B_L : HTML_QUOT_EN_B_L); when :plaintext then (quote_lang.last == :ru ? QUOT_RU_B_L : QUOT_EN_B_L); end
							inside << :quote_b
							quote_char << char
						end
					when :quote_b
						if char == quote_char.last
							fixed += case format; when :html then (quote_lang.last == :ru ? HTML_QUOT_RU_B_R : HTML_QUOT_EN_B_R); when :plaintext then (quote_lang.last == :ru ? QUOT_RU_B_R : QUOT_EN_B_R); end
							inside << :quote_a
							quote_char.pop
							quote_lang.pop
						else
							quote_lang << (cyrillic?(text[i, lang_check_max_take]) ? :ru : :en)
							fixed += case format; when :html then (quote_lang.last == :ru ? HTML_QUOT_RU_A_L : HTML_QUOT_EN_A_L); when :plaintext then (quote_lang.last == :ru ? QUOT_RU_A_L : QUOT_EN_A_L); end
							inside << :quote_a
							quote_char << char
						end
					when nil
						quote_lang = (cyrillic?(text[i, lang_check_max_take]) ? [:ru] : [:en])
						fixed += case format; when :html then (quote_lang.last == :ru ? HTML_QUOT_RU_A_L : HTML_QUOT_EN_A_L); when :plaintext then (quote_lang.last == :ru ? QUOT_RU_A_L : QUOT_EN_A_L); end
						inside << :quote_a
						quote_char = [char]
					end
					next
				end
				fixed += char
			end
			fixed += HTML_NOBR_R if need_nobr_r
			fixed
		end

		# Shows whether cyrillic is present in a block of text
		# == Parameters:
		# +text+:: +String+ of text to check
		# == Returns:
		# +Bool+:: Whether cyrillic is present
		def self.cyrillic?(text)
			raise TypeError unless text.is_a? String

			!text.match(/[а-яА-Я]/).nil?
		end

		# Shows whether whitespace is present in a block of text
		# == Parameters:
		# +text+:: +String+ of text to check
		# == Returns:
		# +Bool+:: Whether whitespace is present
		def self.whitespace?(text)
			raise TypeError unless text.is_a? String

			text.each_char do |i|
				return true if SPACES.include? i
			end
			false
		end
	end

end
