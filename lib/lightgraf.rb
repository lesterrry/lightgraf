# Handcrafted by Aydar N.
# 2023
#
# me@aydar.media
#

# frozen_string_literal: true

require 'lightgraf/version'
require 'lightgraf/internal'
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

		Internal.fix text, html_encode: html_encode, disable_quotes: disable_quotes, lang_check_max_take: lang_check_max_take
	end

end
