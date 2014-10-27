# Add a method to String to check if the String is an integer in quotes.
class String
	def is_i?
		/\A[-+]?\d+\z/ === self
	end
end

# Add a method to split Integer into its places (tens, hundreds, etc.).
class Integer
	def to_places
		numbers = self.to_s.chars.map(&:to_i)
		multipliers = (0...numbers.size).to_a.reverse

		numbers.each_with_index.map do |number, index|
			number * (10 ** multipliers[index])
		end
	end
end

TO_ARABIC = {
	"I" => 1,
	"V" => 5,
	"X" => 10,
	"L" => 50,
	"C" => 100,
	"D" => 500,
	"M" => 1000
}
TO_ROMAN = TO_ARABIC.invert

def is_arabic?(number)
	number.is_i?
end

def is_roman?(number)
	roman = true
	
	number.chars.each do |char|
		roman = false unless TO_ARABIC.keys.include?(char)
	end

	roman
end

def to_arabic(roman)
	result = 0
	index = 0

	while roman[index]
		if TO_ARABIC[roman[index + 1]] && TO_ARABIC[roman[index]] < TO_ARABIC[roman[index + 1]]
			result += TO_ARABIC[roman[index + 1]] - TO_ARABIC[roman[index]]
			index += 2
		else
			result += TO_ARABIC[roman[index]]
			index += 1
		end
	end

	result
end

def to_roman(arabic)
	result = ""
	places = arabic.to_i.to_places
	places.delete(0)

	places.each do |place|
		# Convert place to roman numerals.
		greater_than_numerals = TO_ROMAN.keys.select { |key| place >= key }
		less_than_numerals = TO_ROMAN.keys.select { |key| place < key }
		next_highest = less_than_numerals.min || 1000

		# Account for weird cases like IX.
		# Checks if 10^x of the lowest numeral greater than place minus place is an integer.
		if place < next_highest && Math.log10(next_highest - place) % 1 == 0
			result += TO_ROMAN[less_than_numerals.min - place]
			result += TO_ROMAN[less_than_numerals.min]
		else
			remainder = place

			while remainder > 0
				greater_than_numerals = TO_ROMAN.keys.select { |key| remainder >= key }
				maximum = greater_than_numerals.max
				
				result += TO_ROMAN[maximum]
				remainder -= maximum
			end
		end
	end

	result
end

def convert_numeral(value)
	if is_arabic?(value)
		to_roman(value)
	elsif is_roman?(value)
		to_arabic(value)
	else
		"?"
	end
end

ARGV.each do |argument|
	puts "#{argument} = #{convert_numeral(argument)}"
end
