# Handcrafted by Aydar N.
# 2023
#
# me@aydar.media
#

# frozen_string_literal: true

require 'test_helper'

class LightgrafNobrTest < Minitest::Test
	def test_nobr
		strings = [
			[
				%(Знаю, когда-нибудь все будет хорошо),
				%(Знаю, <nobr>когда-нибудь</nobr> все будет хорошо),
				{ html_encode: true }
			],
			[
				%(Во-первых, это красиво),
				%(<nobr>Во-первых,</nobr> это красиво),
				{ html_encode: true }
			],
			[
				%(Похоронное бюро Воронежа: 279-20-80),
				%(Похоронное бюро Воронежа: <nobr>279-20-80</nobr>),
				{ html_encode: true }
			],
			[
				%(Боюсь, вы еще плохо знакомы с порядками "Хэмпден-колледжа"),
				%(Боюсь, вы еще плохо знакомы с порядками <nobr>«Хэмпден-колледжа»</nobr>),
				{ html_encode: true }
			]
		]
		assert_string_array strings, ignore_nbsp: true
	end
end
