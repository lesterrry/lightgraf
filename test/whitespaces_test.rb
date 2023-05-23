# Handcrafted by Aydar N.
# 2023
#
# me@aydar.media
#

# frozen_string_literal: true

require 'test_helper'

# Tests whether replacing invisible characters & repeating spaces works
class LightgrafWhitespacesTest < Minitest::Test
	def test_nbsp
		strings = [
			[
				%(Добрый   день   товарищи!),
				%(Добрый день товарищи!)
			],
			[
				%(Грибной​соевый⁠соус CHINSU),
				%(Грибной соевый соус CHINSU)
			]
		]
		assert_string_array strings
	end
end
