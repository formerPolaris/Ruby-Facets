# Prompt

# Write a method that takes a string as input. It should return true if the
# input is a valid IPv4 address (ie. anything between 0.0.0.0 and
# 255.255.255.255 is valid).

# Polaris's solution

# Split the given string into four pieces on the periods. Right out of the gate,
# if it's not a four-parter, it's not valid. Now let's check the substrings from
# the split.

# Are they the expected 1-3 digits in length? Are they all digits?
# And do the digits constitute a value between 0 and 255?

# If the answer to any of these questions (visited in order, mind you) is no,
# then we can immediately return false. If all the checks are passed, we return
# true.

# This solution is slightly more rigorous, if less elegant, than AA's solution.

def valid_ip?(ip_string)
  test_array = ip_string.split(".")
  return false if test_array.length != 4
  test_array.each do |sub_string|
    return false unless sub_string.length.between?(0, 4) && 
      sub_string.match(/[[:digit:]]/) && 
      sub_string.to_i.between?(0, 255)
  end
  true
end

p "0.0.0.0 is valid: " + valid_ip?("0.0.0.0").to_s
p "255.255.255.255 is valid: " + valid_ip?("255.255.255.255").to_s
p "128.128.128.128 is valid: " + valid_ip?("128.128.128.128").to_s
p "256.256.256.256 is valid: " + valid_ip?("256.256.256.256").to_s
p "pork.pork.pork.pork is valid: " + valid_ip?("pork.pork.pork.pork").to_s
p "128.128.128 is valid: " + valid_ip?("128.128.128").to_s