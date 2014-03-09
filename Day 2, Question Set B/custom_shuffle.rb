# Prompt

# You are given an array and a random number generator. Shuffle the array.

# Polaris's solution

# Made for both mod and non-modded input. All it does is split out a random
# object from the array into a new array, shrinking the sampled array with each
# operation.

# The input-modding operation performs splits on the original array,
# then once finished points that now-empty, original array back at a new array
# into which the samples were dumped.

# The non-modding operation does basically the same thing with a duplicated
# array, only returning the new sample collection new_arr instead of changing
# the original array's reference.

def custom_shuffle!(arr)
  new_arr = []
  dup_arr = arr.dup
  until dup_arr.length == 0
    new_arr << dup_arr.slice!(rand(dup_arr.length))
  end
  new_arr
end

def custom_shuffle!(arr)
  new_arr = []
  until arr.length == 0
    new_arr << arr.slice!(rand(arr.length))
  end
  arr = new_arr
  arr
end

p "[1,2,3,4] dangerously shuffled is " + custom_shuffle!([1,2,3,4]).to_s
p "[1,2,3,4] safely shuffled is " + custom_shuffle!([1,2,3,4]).to_s