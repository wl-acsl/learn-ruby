# Arithmetic Operators
#
# + - * / ** %

# Addition
puts "2 + 3 = #{2 + 3}"

# Subtraction
puts "2 - 3 = #{2 - 3}"

# Multiplication
puts "2 * 3 = #{2 * 3}"

# Division
# ".0" is appended to the numbers because there is a difference between integer and float division in Ruby.
# Integer division (division between two integers, such as 2 / 3) only returns integers.
# If we want to return a decimal, we need one or both of the numbers to be a float.
# That will cause float division to occur.
# A float can be designated by adding a ".0" to the end of an integer.
# Therefore, we do it here to get a decimal answer.
puts "2.0 / 3.0 = #{2.0 / 3.0}"

# Following are the more obscure arithmetic operators.
# First is just a symbol that you are not used to seeing.
# This is "raise to the power of".
# It is more commonly denoted as ^ (i.e. 2 ^ 3).
# As in, 2 ** 3 is 2 cubed, or 8.
puts "2 ** 3 = #{2 ** 3}"

# Modulus returns the remainder of the division between the two values.
# For example, 2 % 2 is 0 because 2 / 2 is 1 and has no remainder.
# 3 % 2 is 1 because 3 / 2 leaves a remainder of 1.
# This is helping for checking if a number is divisible by the other.
# For example, because 15 % 3 is 0 we know that 15 is a multiple of 3.
puts "2 % 3 = #{2 % 3}"
