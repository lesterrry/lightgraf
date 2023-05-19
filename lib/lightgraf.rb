# Handcrafted by Aydar N.
# 2023
#
# me@aydar.media
#

# frozen_string_literal: true

require 'lightgraf/version'
require 'lightgraf/helpers'
require 'cgi'

# Contains main typography methods
module Lightgraf
	class Error < StandardError; end

	# Fixes formatting of a block of text, returning formatted text
	# == Parameters:
	# +text+:: +String+ of text to format
	# +disabled+:: (Optional) +Array+ of symbols which represent format options to disable. Refer to Readme for guidance.
	# == Returns:
	# +String+:: Formatted text
	def self.fix(text, html_encode: true, disable_quotes: false, lang_check_max_take: 5)
		raise TypeError unless text.is_a? String

		text = CGI.unescape_html text
		fixed = ''
		inside = []
		quote_char = []
		quote_lang = []
		(0..text.length - 1).each do |i|
			char = text[i]
			if char == %(<)
				inside << :tag
			elsif char == %(>)
				inside.pop if inside.last == :tag
			elsif char == %(«)
				inside << :quote_a
			elsif char == %(»)
				inside.pop if inside.last == :quote_a
			elsif inside.last != :tag and %w[' " `].include?(char) and !disable_quotes
				case inside.last
				when :quote_a
					if char == quote_char.last
						fixed += quote_lang.last == :ru ? %(») : %(”)
						inside.pop
						quote_char = []
						quote_lang = []
					else
						quote_lang << (Helpers.cyrillic?(text[i, lang_check_max_take]) ? :ru : :en)
						fixed += quote_lang.last == :ru ? %(„) : %(“)
						inside << :quote_b
						quote_char << char
					end
				when :quote_b
					if char == quote_char.last
						fixed += quote_lang.last == :ru ? %(“) : %(”)
						inside << :quote_a
						quote_char.pop
						quote_lang.pop
					else
						fixed += quote_lang.last == :ru ? %(») : %(”)
						inside.pop
						quote_char = []
						quote_lang = []
					end
				when nil
					quote_lang = (Helpers.cyrillic?(text[i, lang_check_max_take]) ? [:ru] : [:en])
					fixed += quote_lang.last == :ru ? %(«) : %(“)
					inside << :quote_a
					quote_char = [char]
				end
				next
			end
			fixed += char
		end
		html_encode ? CGI.escape_html(fixed) : fixed
	end
end
