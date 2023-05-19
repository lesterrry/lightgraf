# frozen_string_literal: true

# Private methods for things to work
module Helpers
	# Shows whether cyrillic is present in a block of text
	# == Parameters:
	# +text+:: +String+ of text to check
	# == Returns:
	# +Bool+:: Whether cyrillic is present
	def self.cyrillic?(text)
		raise TypeError unless text.is_a? String

		!text.match(/[а-яА-Я]/).nil?
	end
end
