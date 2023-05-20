# Handcrafted by Aydar N.
# 2023
#
# me@aydar.media
#

# frozen_string_literal: true

require 'test_helper'

# Tests whether formatting incorrect quotes works (Russian)
class LightgrafQuotesRuTest < Minitest::Test
	def test_simple_quotes
		strings = [
			[
				%(Компания "Додо Пицца" ищет курьеров),
				%(Компания «Додо Пицца» ищет курьеров)
			],
			[
				%(Компания 'Василек' ищет курьеров),
				%(Компания «Василек» ищет курьеров)
			],
			[
				%("Аврора" это крупнейший крейсер времен второй мировой),
				%(«Аврора» это крупнейший крейсер времен второй мировой)
			],
			[
				%('Нимитц' это крупнейший крейсер времен второй мировой),
				%(«Нимитц» это крупнейший крейсер времен второй мировой)
			],
			[
				%(Мы ели в лучшем ресторане Воронежа: "У Марины"),
				%(Мы ели в лучшем ресторане Воронежа: «У Марины»)
			],
			[
				%(Мы ели в лучшем ресторане Воронежа: 'У Лены'),
				%(Мы ели в лучшем ресторане Воронежа: «У Лены»)
			],
			[
				%("Альфа", 'Бета' и "Омега"),
				%(«Альфа», «Бета» и «Омега»)
			]
		]
		assert_string_array strings
	end

	def test_complicated_quotes
		strings = [
			[
				%(Механик сказал: "Машине конец, тем более если на ней стоит 'В6'"),
				%(Механик сказал: «Машине конец, тем более если на ней стоит „В6“»)
			],
			[
				%(Механик сказал: 'Машине конец, тем более если на ней стоит "В12"'),
				%(Механик сказал: «Машине конец, тем более если на ней стоит „В12“»)
			],
			[
				%("Машине конец" — сказал механик — "Тем более если на ней стоит 'В6'"),
				%(«Машине конец» — сказал механик — «Тем более если на ней стоит „В6“»)
			],
			[
				%('Машине конец' — сказал механик — 'Тем более если на ней стоит "В12"'),
				%(«Машине конец» — сказал механик — «Тем более если на ней стоит „В12“»)
			],
			[
				%(Генри произнес: "Здесь не вопрос 'куда?', а вопрос 'где?'. Ставлю на аблатив".),
				%(Генри произнес: «Здесь не вопрос „куда?“, а вопрос „где?“. Ставлю на аблатив».)
			],
			[
				%(Генри произнес: 'Здесь не вопрос "зачем?", а вопрос "почему?". Ставлю на именительный'.),
				%(Генри произнес: «Здесь не вопрос „зачем?“, а вопрос „почему?“. Ставлю на именительный».)
			],
			[
				%("'Монблан' серии 'Майстерштюк' — лучшие ручки из когда-либо созданных" — сказал Ричард),
				%(«„Монблан“ серии „Майстерштюк“ — лучшие ручки из когда-либо созданных» — сказал Ричард)
			],
			[
				%('"Монблан" серии "Майстерштюк" — лучшие ручки из когда-либо созданных' — сказал Ричард),
				%(«„Монблан“ серии „Майстерштюк“ — лучшие ручки из когда-либо созданных» — сказал Ричард)
			]
		]
		assert_string_array strings
	end

	def test_mixed_quotes
		strings = [
			[
				%(Механик сказал: «Машине конец, тем более если на ней стоит "В6"»),
				%(Механик сказал: «Машине конец, тем более если на ней стоит „В6“»)
			],
			[
				%(Механик сказал: «Машине конец, тем более если на ней стоит 'В6'»),
				%(Механик сказал: «Машине конец, тем более если на ней стоит „В6“»)
			],
			[
				%(Механик сказал: „Машине конец, тем более если на ней стоит "В6"“),
				%(Механик сказал: „Машине конец, тем более если на ней стоит «В6»“)
			],
			[
				%(Механик сказал: „Машине конец, тем более если на ней стоит 'В6'“),
				%(Механик сказал: „Машине конец, тем более если на ней стоит «В6»“)
			]
		]
		assert_string_array strings
	end

	def test_multilayer_quotes
		strings = [
			[
				%(Старик произнес: "Эта мелочь смела сказать мне 'Окей, бумер, иди играй в "судоку"'. Совсем оборзели."),
				%(Старик произнес: «Эта мелочь смела сказать мне „Окей, бумер, иди играй в «судоку»“. Совсем оборзели.»)
			],
			[
				%(Старик ушел в рекурсию и сказал: "Эта мелочь смела сказать мне 'Окей, бумер, давай выдай еще "Эта мелочь смела сказать мне 'Окей, бумер, иди играй в "судоку"'. Совсем оборзели."'. Совсем оборзели."),
				%(Старик ушел в рекурсию и сказал: «Эта мелочь смела сказать мне „Окей, бумер, давай выдай еще «Эта мелочь смела сказать мне „Окей, бумер, иди играй в «судоку»“. Совсем оборзели.»“. Совсем оборзели.»)
			]
		]
		assert_string_array strings
	end
end

# Tests whether formatting incorrect quotes works (English)
class LightgrafQuotesEnTest < Minitest::Test
	def test_simple_quotes
		strings = [
			[
				%(Company "Dodo Pizza" is looking for couriers),
				%(Company “Dodo Pizza” is looking for couriers)
			],
			[
				%(Company 'Sunflower' is looking for couriers),
				%(Company “Sunflower” is looking for couriers)
			],
			[
				%("Alpha", 'Beta' and "Omega"),
				%(“Alpha”, “Beta” and “Omega”)
			]
		]
		assert_string_array strings
	end

	def test_complicated_quotes
		strings = [
			[
				%(The technician said: "Your car is cooked, especially if it has 'V6'"),
				%(The technician said: “Your car is cooked, especially if it has ‘V6’”)
			],
			[
				%(The technician said: 'Your car is cooked, especially if it has "V12"'),
				%(The technician said: “Your car is cooked, especially if it has ‘V12’”)
			],
			[
				%(Henry proclaimed: "It is not about 'where to?', but 'where?'. I go for ablative".),
				%(Henry proclaimed: “It is not about ‘where to?’, but ‘where?’. I go for ablative”.)
			],
			[
				%(Henry proclaimed: 'It is not about "where to?", but "where?". I go for ablative'.),
				%(Henry proclaimed: “It is not about ‘where to?’, but ‘where?’. I go for ablative”.)
			],
		]
		assert_string_array strings
	end

	def test_mixed_quotes
		strings = [
			[
				%(The technician said: “Your car is cooked, especially if it has 'V6'”),
				%(The technician said: “Your car is cooked, especially if it has ‘V6’”)
			],
			[
				%(The technician said: “Your car is cooked, especially if it has "V6"”),
				%(The technician said: “Your car is cooked, especially if it has ‘V6’”)
			],
			[
				%(The technician said: ‘Your car is cooked, especially if it has 'V6'‘),
				%(The technician said: ‘Your car is cooked, especially if it has “V6”‘)
			],
			[
				%(The technician said: ‘Your car is cooked, especially if it has "V6"‘),
				%(The technician said: ‘Your car is cooked, especially if it has “V6”‘)
			],
		]
		assert_string_array strings
	end

	def test_multilayer_quotes
		strings = [
			[
				%(The old man said, "They little things dared to tell me, 'OK, boomer, go play "Sudoku"'. They are completely bonkers."),
				%(The old man said, “They little things dared to tell me, ‘OK, boomer, go play “Sudoku”’. They are completely bonkers.”)
			]
		]
		assert_string_array strings
	end

end

# Tests whether formatting incorrect quotes works (Mixed languages)
class LightgrafQuotesMixedTest < Minitest::Test
	def test_simple_quotes
		strings = [
			[
				%(Компания "Dodo Pizza" ищет курьеров),
				%(Компания “Dodo Pizza” ищет курьеров)
			],
			[
				%(Компания "Dodo Pizza" ищет курьеров в отдел "Системная аналитика"),
				%(Компания “Dodo Pizza” ищет курьеров в отдел «Системная аналитика»)
			],
			[
				%("Alpha", 'Бета' и "Omega"),
				%(“Alpha”, «Бета» и “Omega”)
			]
		]
		assert_string_array strings
	end

	def test_complicated_quotes
		strings = [
			[
				%(Механик сказал: "Машине конец, тем более если на ней стоит 'V6'"),
				%(Механик сказал: «Машине конец, тем более если на ней стоит ‘V6’»)
			],
			[
				%(Механик сказал: 'Машине конец, тем более если на ней стоит "V12"'),
				%(Механик сказал: «Машине конец, тем более если на ней стоит ‘V12’»)
			],
			[
				%(Генри произнес: "Здесь не вопрос 'where?', а вопрос 'что?'. Ставлю на аблатив".),
				%(Генри произнес: «Здесь не вопрос ‘where?’, а вопрос „что?“. Ставлю на аблатив».)
			],
			[
				%(Генри произнес: 'Здесь не вопрос "where?", а вопрос "что?". Ставлю на аблатив'.),
				%(Генри произнес: «Здесь не вопрос ‘where?’, а вопрос „что?“. Ставлю на аблатив».)
			],
			[
				%(Henry proclaimed: "It is not about 'где?', but 'куда?'. I go for именительный".),
				%(Henry proclaimed: “It is not about „где?“, but „куда?“. I go for именительный”.)
			],
			[
				%(Henry proclaimed: 'It is not about "где?", but "куда?". I go for именительный'.),
				%(Henry proclaimed: “It is not about „где?“, but „куда?“. I go for именительный”.)
			],
		]
		assert_string_array strings
	end
end

class LightgrafQuotesBadPracticeTest < Minitest::Test
	def test_broken_quotes
		strings = [
			[
				%(Генри произнес: "Здесь не вопрос "что?", а вопрос "как?". Ставлю на родительный"),
				%(Генри произнес: «Здесь не вопрос »что?«, а вопрос »как?«. Ставлю на родительный»)
			]
		]
		assert_string_array strings
	end

	def test_interrupted_quote
		strings = [
			[
				%(Старик произнес: "Эта мелочь смела сказать мне 'Окей, бумер"),
				%(Старик произнес: «Эта мелочь смела сказать мне „Окей, бумер“)
			]
		]
		assert_string_array strings
	end
end
