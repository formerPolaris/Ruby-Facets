# Prompt

# Write a function that will take a string and return the indices of the
# start/end of the longest palindrome it contains.

# Your palindrome checker could reverse the string and compare it to the
# original, but that takes extra memory (that takes O(n) extra memory).
# Instead, you should be able to solve the problem with O(1) memory.

# Polaris's solution

# The constraint here is on memory rather than time complexity. That means I
# shouldn't need to create data structures whose sizes in memory scale with the
# string length.

# Like with many problems before, I'll start by checking the longest string
# for palindrome-ness, then whittle it down if nothing is found. Once I do find
# the palindrome, I'll return a string corresponding to the indices in the main
# string that describe it.

def longest_palidrome(some_str)
  eval_length = some_str.length
  until eval_length <= 0
    (some_str.length - eval_length + 1).times do |time|

    end
    eval_length -= 1
  end
  nil
end