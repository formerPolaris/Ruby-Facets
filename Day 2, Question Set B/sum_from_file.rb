# Prompt

# Write a method that reads in a file of integers, one per line, and sums them.
# Skip the line if it begins with a "#".

# Polaris's solution

# Check each line. Is it a digit? Add it to the sum. If not, skip. Return the
# sum. Test this file with $ ruby sum_from_file.rb test.txt

def sum_from_file
  sum = 0
  file = ARGV[0]
  IO.readlines(file).each do |line|
    next unless line.match(/[[:digit:]]/)
    sum += line.to_i
  end
  sum
end

p "The sum of a file with lines 1, 2, 3, #, \"Daffy\", 4 is #{sum_from_file}"