# Prompt

# Write a method that finds all the unique substrings for a word. A results
# array and the include? method can be used to enforce uniqueness, but it adds
# the time cost of iterating through that array to check for inclusion.
# Keeping track of substrings in a hash is more efficient.

# Polaris's solution

# Similar to my solution for the "common substrings" problem, I'll iterate
# through the string looking for substrings of a length equal to the string
# itself. This length will decrease by one on each pass until the substring
# length is zero.

# Each substring will be added to a hash that includes a count of the
# occurrences of the substring in the main string; an option can be specified
# for the method call such that only substrings appearing a certain number of
# times will be returned. The default case will be one and only one appearance.

# This differs from AA's solution in that their solution lists every substring,
# even if it appears more than once.

def unique_subs(word, options = {:occurrences => 1})
  out_array = []
  occurrences_hash = {}
  num_occurrences = options[:occurrences]

  substring_length = word.length
  while substring_length > 0
    (word.length - substring_length + 1).times do |time|
      current_substring = word[time..substring_length + time - 1]
      if occurrences_hash[current_substring].nil? 
        occurrences_hash[current_substring] = 1
      else 
        occurrences_hash[current_substring] += 1
      end
    end
    substring_length -= 1
  end

  occurrences_hash.each do |key, value|
    out_array << key if value == num_occurrences
  end
  out_array
end

test_word = "blahblah"
p "The unique substrings for #{test_word} are: "
unique_subs(test_word).each do |word|
  p word
end