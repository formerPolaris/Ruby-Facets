# Prompt

# You are given an array with integers (both positive and negative) in any
# random order. Find the sub-array with the largest sum.

# Polaris's solution

# And as with the previous problem, unique substrings, it's apparent that I
# can once again apply what I call "shrinking checks" to the array to get every
# possible subarray. It's then a matter of just iterating over each to get a
# running total and comparing this to the largest sum thus far recorded.

# This solution uses a different approach than AA's solution.

def biggest_sum(some_array)
  largest_sum = nil
  largest_sum_array = []
  (some_array.length - 1).times do |outer_time| # Don't check length 1 subarrays
    current_length = some_array.length - outer_time
    (some_array.length - current_length + 1).times do |inner_time|
      current_subarray = some_array[inner_time...inner_time + current_length]
      current_sum = current_subarray.inject {|sum, element| sum += element}
      if largest_sum.nil? || current_sum > largest_sum
        largest_sum = current_sum
        largest_sum_array = current_subarray
      end
    end
  end
  largest_sum_array
end

test_array = [-2, 1, 2, 3, -4, 3, 4, -4]
p "The subarray from #{test_array} that yields the largest sum is #{biggest_sum(test_array)}"