# Prompt

# Implement merge sort.

# Polaris's solution

# The merge sort works by splitting an array down to its component elements,
# then recombining (merging) them in a sorted way. This means I can recursively
# run a splitting method on an array until the splitting method gets a
# one-element array, at which point my method will piece them back together
# properly.

# [8 7 6 5 4 3 2 1]
# [8 7 6 5] [4 3 2 1]
# [8 7] [6 5] [4 3] [2 1]
# [8] [7] [6] [5] [4] [3] [2] [1]
# [7 8] [5 6] [3 4] [1 2]
# [5 6 7 8] [1 2 3 4]
# [1 2 3 4 5 6 7 8]

# When deciding which element to stick in an array such that it's sorted
# (merging), I'll have to check left and right arrays. Since the left will
# always be the same length or longer with respect to the right, there can be 
# three cases of which elements to put in the sorted array in a particular
# order.

def merge_sort(array)
  return array if array.length < 2
  left = merge_sort(array[0..(array.length - 1) / 2])
  right = merge_sort(array[(array.length - 1) / 2 + 1..-1])

  sorted = []

  while (left.length > 0 || right.length > 0)
    if right.length == 0
      sorted << left.shift 
    elsif left.length == 0
      sorted << right.shift
    else
      case right[0] <=> left[0]
      when 1
        sorted << left.shift
      when -1
        sorted << right.shift
      else
        sorted.concat([left.shift, right.shift])
      end
    end
  end

  sorted
end

test_array = [8,7,6,5,3,4,2,3]
p "#{test_array} merge sorted is #{merge_sort(test_array)}"
test_array = [5,7,7,55,2,1,3,4,9]
p "#{test_array} merge sorted is #{merge_sort(test_array)}"