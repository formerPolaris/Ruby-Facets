# Prompt

# Implement binary search.

# Polaris's solution

# The binary search is an algorithm performed on sorted arrays. It works by
# comparing the value being sought (called the search key) to the "middle" value
# of the array.

# If the value is equal to the search key, the index is returned; if it's
# smaller, the process is repeated with the "middle" of the right half; if it's
# larger, the process is repeated with the "middle" of the left half.

# This solution is not quite as elegant or efficient as App Academy's approach,
# which uses a case-when switch for mid_value <=> key.

def binary_search(sorted_array, key)
  return nil if sorted_array.length == 0
  index = (sorted_array.length - 1)/2
  mid_value = sorted_array[index]
  if mid_value == key
    return index
  elsif mid_value > key
    return nil if index == 0 || binary_search(sorted_array[0..index], key).nil?
    return binary_search(sorted_array[0..index], key)
  elsif mid_value < key
    return nil if index == 0 || binary_search(sorted_array[index..-1], key).nil?
    return index + binary_search(sorted_array[index..-1], key)
  end
  nil
end

test_array = [1,3,5,7,9]
test_value = 8
p "In the array #{test_array}, the index of #{test_value} is #{binary_search(test_array, test_value) || "not present"}"
test_value = 3
p "In the array #{test_array}, the index of #{test_value} is #{binary_search(test_array, test_value) || "not present"}"
test_value = 7
p "In the array #{test_array}, the index of #{test_value} is #{binary_search(test_array, test_value) || "not present"}"
test_value = 10
p "In the array #{test_array}, the index of #{test_value} is #{binary_search(test_array, test_value) || "not present"}"
test_value = 0
p "In the array #{test_array}, the index of #{test_value} is #{binary_search(test_array, test_value) || "not present"}"
test_value = 1
p "In the array #{test_array}, the index of #{test_value} is #{binary_search(test_array, test_value) || "not present"}"