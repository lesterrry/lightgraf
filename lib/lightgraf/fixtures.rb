# frozen_string_literal: true

module Lightgraf
	# Flags & symbols to operate
	module Fixtures
		INCORRECT_QUOTES = %w[' " `].freeze
		TAG_L       = %(<)
		TAG_R       = %(>)
		QUOT_RU_A_L = %(«)
		QUOT_RU_A_R = %(»)
		QUOT_RU_B_L = %(„)
		QUOT_RU_B_R = %(“)
		QUOT_EN_A_L = %(“)
		QUOT_EN_A_R = %(”)
		QUOT_EN_B_L = %(‘)
		QUOT_EN_B_R = %(’)
	end
end