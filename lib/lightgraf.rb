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
	# +text+:: +String+: Text to format
	# +format+:: Optional +Sym+: How to format output (+:plaintext+ / +:html+)
	# +disable_quotes+:: Optional +Bool+: Whether to disable fixing quotation
	# +disable_hyphens+:: Optional +Bool+: Whether to disable fixing hyphens
	# +disable_nbsp+:: Optional +Bool+: Whether to disable fixing whitespaces
	# +disable_nobr+:: Optional +Bool+: Whether to disable adding <nobr>
	# +disable_escape+:: Optional +Bool+: Whether to disable escaping html-specific chars like +&+
	# +lang_check_max_take+:: Optional +Int+: Max number of chars to consider while analyzing quotation language
	# == Returns:
	# +String+:: Formatted text
	def self.fix(text, format: :plaintext, disable_quotes: false, disable_hyphens: false, disable_nbsp: false, disable_nobr: false, disable_escape: false, lang_check_max_take: 5)
		Internal.fix text, format: format, disable_quotes: disable_quotes, disable_hyphens: disable_hyphens, disable_nbsp: disable_nbsp, disable_nobr: disable_nobr, disable_escape: disable_escape, lang_check_max_take: lang_check_max_take
	end

end
