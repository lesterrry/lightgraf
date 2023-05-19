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
		assert_equal i[1], Lightgraf.fix(i[0], html_encode: i[3] == true, disable_quotes: i[2] == true)
	end
end
