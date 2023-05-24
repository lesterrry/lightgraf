# Handcrafted by Aydar N.
# 2023
#
# me@aydar.media
#

# frozen_string_literal: true

require 'test_helper'

class LightgrafFormattingTest < Minitest::Test
	def test_plaintext
		strings = [
			[
				%(Знаю, когда-нибудь все будет хорошо),
				%(Знаю, когда-нибудь все будет хорошо),
				{ format: :plaintext }
			],
			[
				%(Мой номер - +7 (977) 417-50-96),
				%(Мой номер — +7 (977) 417-50-96),
				{ format: :plaintext }
			],
			[
				%(А что я? А я ничего.),
				%(А что я? А я ничего.),
				{ format: :plaintext }
			],
			[
				%(Генри произнес: 'Здесь не вопрос "зачем?", а вопрос "почему?". Ставлю на именительный'.),
				%(Генри произнес: «Здесь не вопрос „зачем?“, а вопрос „почему?“. Ставлю на именительный».),
				{ format: :plaintext }
			],
			[
				%(Henry proclaimed: 'It is not about "where to?", but "where?". I go for ablative'.),
				%(Henry proclaimed: “It is not about ‘where to?’, but ‘where?’. I go for ablative”.),
				{ format: :plaintext }
			]
		]
		assert_string_array strings, ignore_nbsp: false
	end

	def test_html
		strings = [
			[
				%(Знаю, когда-нибудь все будет хорошо),
				%(Знаю, <nobr>когда-нибудь</nobr> все будет хорошо),
				{ format: :html }
			],
			[
				%(Мой номер - +7(977)417-50-96),
				%(Мой номер&nbsp;&mdash; <nobr>+7(977)417-50-96</nobr>),
				{ format: :html }
			],
			[
				%(А что я? А я ничего.),
				%(А&nbsp;что я?&nbsp;А&nbsp;я&nbsp;ничего.),
				{ format: :html }
			],
			[
				%(Генри произнес: 'Здесь не вопрос "зачем?", а вопрос "почему?". Ставлю на именительный'.),
				%(Генри произнес: &laquo;Здесь не&nbsp;вопрос &bdquo;зачем?&ldquo;, а&nbsp;вопрос &bdquo;почему?&ldquo;. Ставлю на&nbsp;именительный&raquo;.),
				{ format: :html }
			],
			[
				%(Henry proclaimed: 'It is not about "where to?", but "where?". I go for ablative'.),
				%(Henry proclaimed: &ldquo;It is&nbsp;not about &lsquo;where to?&rsquo;, but &lsquo;where?&rsquo;. I&nbsp;go&nbsp;for ablative&rdquo;.),
				{ format: :html }
			]
		]
		assert_string_array strings, ignore_nbsp: false
	end
end
