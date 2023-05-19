# Handcrafted by Aydar N.
# 2023
#
# me@aydar.media
#

# frozen_string_literal: true

require 'test_helper'

class LightgrafHtmlTest < Minitest::Test
	def test_tags_ignore
		strings = [
			[
				%(<span>Механик сказал: "Машине конец</span>, тем более если на ней стоит <em>'V6'</em>"),
				%(<span>Механик сказал: «Машине конец</span>, тем более если на ней стоит <em>„V6“</em>»)
			],
			[
				%(<span class="main">Механик сказал: "Машине конец</span>, тем более если на ней стоит <em id='a'>'V12'</em>"),
				%(<span class="main">Механик сказал: «Машине конец</span>, тем более если на ней стоит <em id='a'>„V12“</em>»)
			],
		]
		strings.each do |i|
			assert_equal Lightgraf.fix(i[0], html_encode: false), i[1]
		end
	end
end
