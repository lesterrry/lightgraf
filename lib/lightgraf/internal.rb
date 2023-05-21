# frozen_string_literal: true

require 'lightgraf/fixtures'
require 'cgi'

module Lightgraf

	# Main internal parser
	module Internal
		include Fixtures

		def self.fix(
			text,
			html_encode: true,
			disable_quotes: false,
			disable_hyphens: false,
			disable_nbsp: false,
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
			(0..text.length - 1).each do |i|
				char = text[i]
				if char == TAG_L
					inside << :tag
				elsif char == TAG_R
					inside.pop if inside.last == :tag
				elsif inside.last == :tag
					fixed += char
					next
				elsif [QUOT_RU_A_L, QUOT_EN_A_L].include?(char)
					inside << :quote_a
				elsif [QUOT_RU_A_R, QUOT_EN_A_R].include?(char)
					inside.pop if inside.last == :quote_a
				elsif SPACES.include?(char)
					if !disable_nbsp and (i < nbsp_max_length or (!last_space.nil? and last_hyphen != i - 1 and (i - last_space) <= nbsp_max_length) or HYPHENS.include?(text[i + 1]))
						fixed += NBSP
						last_space = i
						next
					end
					last_space = i
				elsif HYPHENS.include?(char)
					if !disable_hyphens and (i.zero? or last_space == i - 1)
						fixed += HYPHEN
						last_hyphen = i
						next
					end
					last_hyphen = i
				elsif !disable_quotes and INCORRECT_QUOTES.include?(char)
					case inside.last
					when :quote_a
						if char == quote_char.last
							fixed += quote_lang.last == :ru ? QUOT_RU_A_R : QUOT_EN_A_R
							inside.pop
							quote_char.pop
							quote_lang.pop
						else
							quote_lang << (cyrillic?(text[i, lang_check_max_take]) ? :ru : :en)
							fixed += quote_lang.last == :ru ? QUOT_RU_B_L : QUOT_EN_B_L
							inside << :quote_b
							quote_char << char
						end
					when :quote_b
						if char == quote_char.last
							fixed += quote_lang.last == :ru ? QUOT_RU_B_R : QUOT_EN_B_R
							inside << :quote_a
							quote_char.pop
							quote_lang.pop
						else
							quote_lang << (cyrillic?(text[i, lang_check_max_take]) ? :ru : :en)
							fixed += quote_lang.last == :ru ? QUOT_RU_A_L : QUOT_EN_A_L
							inside << :quote_a
							quote_char << char
						end
					when nil
						quote_lang = (cyrillic?(text[i, lang_check_max_take]) ? [:ru] : [:en])
						fixed += quote_lang.last == :ru ? QUOT_RU_A_L : QUOT_EN_A_L
						inside << :quote_a
						quote_char = [char]
					end
					next
				end
				fixed += char
			end
			html_encode ? CGI.escape_html(fixed) : fixed
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
