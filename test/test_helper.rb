# Handcrafted by Aydar N.
# 2023
#
# me@aydar.media
#

# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'lightgraf'
require 'lightgraf/fixtures'

require 'minitest/autorun'

def assert_string_array(strings, replace: nil, ignore_nbsp: true)
	strings.each do |i|
		f = Lightgraf.fix(
				i[0],
				format: i[2]&.dig(:format) || :plaintext,
				disable_quotes: i[2]&.dig(:disable_quotes) == true,
				disable_hyphens: i[2]&.dig(:disable_hyphens) == true,
				disable_nbsp: i[2]&.dig(:disable_nbsp) == true,
				disable_nobr: i[2]&.dig(:disable_nobr) == true,
				disable_escape: i[2]&.dig(:disable_escape) == true
		)
		if ignore_nbsp
			f.gsub!(Lightgraf::Fixtures::NBSP, Lightgraf::Fixtures::SPACE)
			f.gsub!(Lightgraf::Fixtures::HTML_NBSP, Lightgraf::Fixtures::SPACE)
		end
		f.gsub!(replace[0], replace[1]) unless replace.nil?
		assert_equal i[1], f
	end
end
