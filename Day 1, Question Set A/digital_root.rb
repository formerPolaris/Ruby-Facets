# Prompt

# Write a method, digital_root(num). It should sum the digits of a positive 
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". Do not use string conversion within your method.

# Polaris's solution and notes

# This is a recursive solution. Single-digit numbers automatically pass as
# return values; they're their own digital roots.

# But what if we need to find the digital root of a bigger number? To do that,
# we add the last digit (num % 10) to other digits (recursively adding each
# digit through successive divisions/mod divs by ten).

# If, even after all of this hullabaloo is completed and all the digits are
# summed, we still have a number greater than ten, we start the process over
# and find the SUM's digital root.

def digital_root(num)
  return num if num < 10
  output = num % 10 + digital_root(num / 10)
  output >= 10 ? digital_root(output) : output
end

puts "The digital root of 1123 is #{digital_root(1123)}" # 7
puts "The digital root of 1126 is #{digital_root(1126)}" # 1
puts "The digital root of 11261126 is #{digital_root(11261126)}" # 2
puts "The digital root of 112611261126 is #{digital_root(112611261126)}" # 3