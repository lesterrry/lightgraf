# Handcrafted by Aydar N.
# 2023
#
# me@aydar.media
#

# frozen_string_literal: true

require 'test_helper'

# Tests whether disabling specific traits actually works
class LightgrafHyphensTest < Minitest::Test
	def test_hyphens
		strings = [
			[
				%(Тойота - крупнейший производитель Тойота Камри),
				%(Тойота — крупнейший производитель Тойота Камри)
			],
			[
				%(- Который час?),
				%(— Который час?)
			],
			[
				%(Мой номер - +7 (977) 417-50-96),
				%(Мой номер — +7 (977) 417-50-96)
			]
		]
		assert_string_array strings
	end
end
