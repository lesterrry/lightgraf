# Handcrafted by Aydar N.
# 2023
#
# me@aydar.media
#

# frozen_string_literal: true

require 'lightgraf/internal'

# Contains main typography methods
module Lightgraf

	class Error < StandardError; end

	# Fixes formatting of a block of text, returning formatted text
	# == Parameters:
	# +text+:: +String+ of text to format
	# +html_encode+:: (Optional) Whether to html-encode output
	# +disable_quotes+:: (Optional) Whether to disable fixing quotation
	# +disable_hyphens+:: (Optional) Whether to disable fixing hyphens
	# +disable_nbsp+:: (Optional) Whether to disable fixing whitespaces
	# +disable_nobr+:: (Optional) Whether to disable adding <nobr>
	# +lang_check_max_take+:: (Optional) Max number of chars to consider while analyzing quotation language
	# == Returns:
	# +String+:: Formatted text
	def self.fix(text, html_encode: true, disable_quotes: false, disable_hyphens: false, disable_nbsp: false, disable_nobr: false, lang_check_max_take: 5)
		Internal.fix text, html_encode: html_encode, disable_quotes: disable_quotes, disable_hyphens: disable_hyphens, disable_nbsp: disable_nbsp, disable_nobr: disable_nobr, lang_check_max_take: lang_check_max_take
	end

end
