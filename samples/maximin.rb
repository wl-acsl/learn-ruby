# Define a function that is a standard math-like function (i.e. linear, quadratic, or polynomial function).  An example of a good one would be f(x) = x + 5 or f(x) = x^4 - 2x^3 + 5x^2 + 6x - 5.  After defining this function, get an input of a lower bound and upper bound and then calculate the integer value that gets the highest value from the function and the lowest value from the function within that range.

def f(x)
	(x ** 4) - (2 * (x ** 3)) + (5 * (x ** 2)) + (6 * x) - 5
end

puts "What is the lower bound?"
lower = gets.chomp.to_i

puts "What is the upper bound?"
upper = gets.chomp.to_i

range = lower..upper

greatest = nil
least = nil
range.each do |number|
	if !greatest || f(number) > greatest
		greatest = f(number)
	end
	
	if !least || f(number) < least
		least = f(number)
	end
end

puts "Least: #{least}"
puts "Greatest: #{greatest}"
