# While Loops
#
# Form:
# while (conditional)
#   (body)
# end

puts rand

while gets.chomp == "continue"
	puts rand
end

# When the body is one-line, we can append it at the end.
# This would look like:
# puts rand while gets.chomp == "continue"
