# Handcrafted by Aydar N.
# 2023
#
# me@aydar.media
#

# frozen_string_literal: true

require 'test_helper'

# Tests whether disabling specific traits actually works
class LightgrafOptionalsTest < Minitest::Test
	def test_disable_quotes
		strings = [
			[
				%(<span class="main">Механик сказал: "Машине конец</span>, тем более если на ней стоит <em id='a'>'В6'</em>"),
				%(<span class="main">Механик сказал: «Машине конец</span>, тем более если на ней стоит <em id='a'>„В6“</em>»),
				false
			],
			[
				%(<span class="main">Механик сказал: "Машине конец</span>, тем более если на ней стоит <em id='a'>'В12'</em>"),
				%(<span class="main">Механик сказал: "Машине конец</span>, тем более если на ней стоит <em id='a'>'В12'</em>"),
				true
			]
		]
		assert_string_array strings
	end
end
