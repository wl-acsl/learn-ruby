# Until Loops
# also known as while loops inverted
#
# Form:
# until (conditional)
#   (body)
# end

puts rand

until gets.chomp == "stop"
	puts rand
end

# When the body is one-line, we can append it at the end.
# This would look like:
# puts rand until gets.chomp == "stop"
