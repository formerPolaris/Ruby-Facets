# Prompt

# Write a function that takes an array of integers and returns their sum.
# Use recursion.

# Polaris's solution

# Add [0] to the remainder. No remainder? Just return [0]!
# (Confession: This is pretty much word-for-word the original solution; while
# my original was close, it didn't handle the edge case of empty arrays.)

def sum_rec(arr)
  return 0 if arr.empty?
  arr[0] + sum_rec(arr.drop(1))
end