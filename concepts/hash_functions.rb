# Functions of Hashes
#

# Clears the hash.
puts ({ "a" => 2 }).clear

# Set the default value of the hash after creation.
{}.default = "not needed"

# Deletes a key from the hash.
hash = { "a" => 2, "b" => 4 }
hash.delete("a")
puts hash
