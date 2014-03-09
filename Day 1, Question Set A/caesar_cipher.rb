# Prompt

# Write a function that takes a message and an increment amount and outputs the
# same letters shifted by that amount in the alphabet. Assume lowercase and no
# punctuation. Preserve spaces.

# Polaris's solution

# An array is created with all the letters of the alphabet. This allows me to
# exploit modular division to get new indices for each letter.

# Starting with an empty string, I iterate through each character of the string
# to be ciphered. If the character is not alphabetic, I preserve it by pushing
# onto the empty string. Otherwise, I get its index in the alphabet array,
# add the increment number, and modularly divide the result by 26 to get the new
# index.

# The now-filled string is my output and is implicitly returned.

def caesar_cipher(string, increment)
  alpha = ("a".."z").to_a
  outString = ""
  string.split("").each do |character|
    dex = alpha.index(character)
    outString << (dex.nil? ? character : alpha[(dex + increment) % 26])
  end
  outString
end

puts "The string \"abc\" ciphered by 1 is #{caesar_cipher("abc", 1)}." # bcd
puts "The string \"abc\" ciphered by -1 is #{caesar_cipher("abc", -1)}." # zab