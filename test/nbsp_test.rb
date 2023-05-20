# Handcrafted by Aydar N.
# 2023
#
# me@aydar.media
#

# frozen_string_literal: true

require 'test_helper'

# Tests whether replacing spaces with non-breakable spaces works
# For readability nbsp has been replaced with percent sign in tests
class LightgrafNbspTest < Minitest::Test
	def test_nbsp
		strings = [
			[
				%(Все готовы покинуть мир вещей и явлений и вступить в область высокого?),
				%(Все готовы покинуть мир вещей и%явлений и%вступить в%область высокого?)
			],
			[
				%(А что я? А я ничего.),
				%(А%что я?%А%я%ничего.)
			],
			[
				%(— Нет ничего ужасней кровопролития, — поспешно сказал Джулиан),
				%(—%Нет ничего ужасней кровопролития,%— поспешно сказал Джулиан)
			]
		]
		assert_string_array strings, replace: %w[  %], ignore_nbsp: false
	end
end
