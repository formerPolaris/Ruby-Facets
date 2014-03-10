# Prompt

# Given an array of integers, return all pairs that sum up to a specified value
# k. List the pairs in [min, max] order.

# Polaris's solution

# This is a bit tricky. Since my approach will be to walk through the array and
# match each value with another that sums to k, I'll have to take into account
# that walking further down the line will bring up the same pair again.

# Two rules, then, apply to making the pair:
# 1. I don't want the same index to be counted twice as a pair.
# 2. If a pair has already been counted, do not attempt to count it again.

# Therefore, if I have a loop within a loop, a pair will only be counted if the
# outer loop's index is less than the inner loop's index. This avoids repeating
# comparisons.

# This varies from App Academy's solution in that this doesn't check for non-
# unique value pairs, i.e. every pair of 4, 6 that sums to ten will be counted
# if 4 and 6 exist at more than one pair of indices in the array.

# AA implements this by using #include to check if the pair already exists in
# the array. I'm not aware of any better ways to implement such a check.

def pair_sum(arr, k)
  pairs = []

  arr.each_with_index do |first_object, first_index|
    arr.each_with_index do |second_object, second_index|
      if first_index < second_index && first_object + second_object == k
        pairs << [
          [first_object, second_object].min,
          [first_object, second_object].max
        ]
      end
    end
  end

  pairs
end

test_array = [1,1,2,2,3,3,4,4,5,5,6,6]
test_value = 10
p "Pairs in #{test_array} that sum to #{test_value} are #{pair_sum(test_array, test_value)}"
p pair_sum([1, 2, -1], 0)          # => #<Set: {[-1, 1]}>
p pair_sum([1, 2, -1, -1], 0)      # => #<Set: {[-1, 1]}>
p pair_sum([1, 2, -1, -1, -2], 0)  # => #<Set: {[-1, 1], [-2, 2]}>
p pair_sum([1, 2, -1, -1, -2], 1)  # => #<Set: {[-1, 2]}>
p pair_sum([1, 2, -1, -1, -2], -1) # => #<Set: {[-2, 1]}>