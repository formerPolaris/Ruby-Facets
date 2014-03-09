# Prompt

# Implement the Folding Cipher. It folds the alphabet in half and uses the
# adjacent letter. Ie. a <=> z, b <=> y, c <=> x, m <=> n.

# Polaris's solution

# While longer than AA's solution, this implementation doesn't require the
# creation of a hash, and it bypasses punctuation and non-alphabetic characters.

# All I'm doing here is just mirroring the alphabet by subtracting the letter's
# index in the alphabet from 25. The character is passed as-is if it's not
# alphabetic.

def folding_cipher(uncoded_string)
  alpha = ("a".."z").to_a
  coded_string = ""

  uncoded_string.split("").each do |character|
    character_index = alpha.index(character.downcase)
    coded_string << (character_index.nil? ? character : alpha[25 - character_index])
  end

  coded_string
end

test_string = "abc def ghi zyx wvu tsr"
p "#{test_string} ciphered is #{folding_cipher(test_string)}"
test_string = "Testing testing testing!"
p "#{test_string} ciphered is #{folding_cipher(test_string)}"
test_string = "Blah blah blah"
p "#{test_string} ciphered is #{folding_cipher(test_string)}"