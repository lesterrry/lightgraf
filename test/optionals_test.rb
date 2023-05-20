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
				%(<span class="main">Механик сказал: "Машине конец</span>, тем более если на ней стоит <em id='a'>'В12'</em>"),
				%(<span class="main">Механик сказал: "Машине конец</span>, тем более если на ней стоит <em id='a'>'В12'</em>"),
				{ disable_quotes: true }
			]
		]
		assert_string_array strings
	end

	def test_disable_hyphens
		strings = [
			[
				%(Тойота - крупнейший производитель Тойота Камри),
				%(Тойота - крупнейший производитель Тойота Камри),
				{ disable_hyphens: true }
			]
		]
		assert_string_array strings
	end

	def test_disable_nbsp
		strings = [
			[
				%(Я люблю его а он не любит меня),
				%(Я люблю его а он не любит меня),
				{ disable_nbsp: true }
			]
		]
		assert_string_array strings, ignore_nbsp: false
	end
end
