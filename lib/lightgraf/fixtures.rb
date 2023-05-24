# frozen_string_literal: true

module Lightgraf

	# Flags & symbols to operate
	module Fixtures
		INCORRECT_QUOTES = %w[' " `].freeze
		HYPHENS = %w[- – —].freeze
		SPACES = [' ', ' ', ' ', ' ', ' ', '​', '‍', '‌', 'ㅤ', '　', ' ', ' ', '⠀', '⁣', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '⁠'].freeze
		TAG_L            = %(<)
		TAG_R            = %(>)
		QUOT_RU_A_L      = %(«)
		QUOT_RU_A_R      = %(»)
		QUOT_RU_B_L      = %(„)
		QUOT_RU_B_R      = %(“)
		QUOT_EN_A_L      = %(“)
		QUOT_EN_A_R      = %(”)
		QUOT_EN_B_L      = %(‘)
		QUOT_EN_B_R      = %(’)
		AMPERSAND        = %(&)
		HYPHEN           = HYPHENS[2]
		SPACE            = SPACES[0]
		NBSP             = SPACES[2]
		HTML_AMPERSAND   = %(&amp;)
		HTML_QUOT_RU_A_L = %(&laquo;)
		HTML_QUOT_RU_A_R = %(&raquo;)
		HTML_QUOT_RU_B_L = %(&bdquo;)
		HTML_QUOT_RU_B_R = %(&ldquo;)
		HTML_QUOT_EN_A_L = %(&ldquo;)
		HTML_QUOT_EN_A_R = %(&rdquo;)
		HTML_QUOT_EN_B_L = %(&lsquo;)
		HTML_QUOT_EN_B_R = %(&rsquo;)
		HTML_NOBR_L      = %(<nobr>)
		HTML_NOBR_R      = %(</nobr>)
		HTML_HYPHEN      = %(&mdash;)
		HTML_NBSP        = %(&nbsp;)
	end

end
