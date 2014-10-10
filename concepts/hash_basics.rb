# Basics of Hashes
#
# A hash can also be thought of as a dictionary or mapping.
# Any object can be mapped to any other object inside it.
# It is useful for storing data such as prices of various store items.
# Data is retrieved similar to an array, but with the key object within the [].

# Creating a new hash can be done in two ways.
# The latter is more common.
Hash.new
{}

# The former allows for specifying a default value.
# If the value does not exist in the hash, the default value is returned.
# Normally, this is nil.
puts Hash.new["unknown"].nil?
puts Hash.new("known")["unknown"]

# Specifying a new hash contents can be done in multiple ways, too.
# The latter is, again, more common.
Hash["a" => 100, "b" => 200]
hash = {
	"a" => 100,
	"b" => 200
}

# A hash links a key to a value.
# In `"a" => 100`, the key is `"a"` and the value is `100`.
# When you access an item in a hash, you access it like an array via the key.
puts hash["a"]

# Any type of object can be the key of a hash.
hash = {
	[0, 0] => "origin",
	[5, 5] => "top-right"
}
puts hash[[0, 0]]
