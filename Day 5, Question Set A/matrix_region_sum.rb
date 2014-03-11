# Prompt

# Given a matrix of integers and coordinates of a rectangular region within the
# matrix, find the sum of numbers falling inside the rectangle.

# Polaris's solution

# I'm going to assume that the coordinates are of the form
# [[top left row, top left column], [bottom right row, bottom right column]].

# So, if I have

# [[0, 1, 2],
#  [3, 4, 5],
#  [6, 7, 8]]

# then [[0,1],[2,2]] corresponds to [
#   [1,2],
#   [4,5],
#   [7,8]
# ]

# And the sum would be 27.

# My solution wound up being virtually identical to AA's solution, with the
# difference that I assumed a different format of coordinates than they used.

def matrix_region_sum(matrix, coords)
  sum = 0;
  (coords[0][0]..coords[1][0]).each do |row|
    (coords[0][1]..coords[1][1]).each do |column|
      sum += matrix[row][column]
    end
  end
  sum
end

test_matrix = [
  [0,1,2],
  [3,4,5],
  [6,7,8]
]

test_coords = [[0,1],[2,2]]

p "The sum of region #{test_coords} from #{test_matrix} is #{matrix_region_sum(test_matrix, test_coords)}"