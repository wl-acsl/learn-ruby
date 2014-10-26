# Add a method to String to check if the String is an integer in quotes.
class String
	def is_i?
		/\A[-+]?\d+\z/ === self
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
