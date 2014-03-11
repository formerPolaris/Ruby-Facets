# Prompt

# Write a function that takes an array and returns all of its subsets.
# How many sets will it return?

# Polaris's solution

# Like with previous algorithmic problems where I had to find all of the
# subsets, I can check the array for all arrays of decreasing lengths.

# In this mode, the number of subsets returned is the length, plus each positive
# integer beneath it, plus one. For example, for an array of length 4, the
# length is 4 + 3 + 2 + 1 + 1.

# My implementation differs from App Academy's implementation in that it doesn't
# count non-contiguous subsets, i.e. every possible unique combination of array
# elements.

def subs(arr)
  out_container = [[]]
  return [[]] if arr.empty?

  current_length = arr.length
  while current_length > 0
    (arr.length - current_length + 1).times do |time|
      out_container << arr[time...current_length + time]
    end
    current_length -= 1
  end
  out_container
end

test_array = [4,3,2,1]
p "The subsets of #{test_array} are #{subs(test_array)}"

# While I've obviously peeked at their solution to see how they did things
# differently, I'll see if I can't walk through that explanation on my own
# memory.

# I'll probably want to take each element in the subsets array and tack it onto
# the next. This will ensure unique subsets. I'll also want to make a copy of
# existing subsets to which the element is not applied.

def rec_comp_subsets(arr) # [1,2,3]
  return [[]] if arr.empty?

  first = arr[0] # [1]
  copy_of_subs = arr.dup
  later_subs = rec_comp_subsets(arr.drop(1)) # this([2,3])

  copy_of_subs + later_subs.map {|element| element.concat([first])} #
end

p "The subsets of #{test_array} are #{rec_comp_subsets(test_array)}"