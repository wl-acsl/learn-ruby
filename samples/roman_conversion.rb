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
end

def to_roman(arabic)
	result = ""
	remainder = arabic.to_i

	while remainder > 0
		accepted_values = TO_ROMAN.keys.select { |value| remainder >= value }
		maximum = accepted_values.max

		result += TO_ROMAN[maximum]
		remainder -= maximum
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
