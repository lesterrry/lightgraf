# Handcrafted by Aydar N.
# 2023
#
# me@aydar.media
#

# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'lightgraf'

require 'minitest/autorun'

def assert_string_array(strings)
	strings.each do |i|
		assert_equal i[1], Lightgraf.fix(
				i[0],
				html_encode: i[2]&.dig(:html_encode) == true,
				disable_quotes: i[2]&.dig(:disable_quotes) == true,
				disable_hyphens: i[2]&.dig(:disable_hyphens) == true
		)
	end
end
