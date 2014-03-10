# Prompt

# Write a function that takes a year (four digit integer) and returns an array
# with the 10 closest subsequent years that meet the following condition: the
# first two digits summed with the last two digits are equal to the middle two
# digits. E.g.,

# 1978 => 19 + 78 = 97
# 2307 => 23 + 07 = 30

# Polaris's solution

# Start with the year. Scan it using a combination of floor/mod division to see
# if it meets the appropriate conditions. Now check one to the left and to the
# right. Repeat with increasingly larger spread until the array is filled or the
# scannable range is passed.

# This differs from App Academy's solution in that string interpolation is never
# used - It relies entirely on math.

def silly_years(year)
  out_array = []
  spread = 0

  until out_array.length == 10 
    left_year = year - spread
    right_year = year + spread
    break if (left_year <= 1000 && right_year >= 9999)

    left_target = left_year % 1000 / 10
    right_target = right_year % 1000 / 10

    out_array << left_year if left_year / 100 + left_year % 100 == left_target && left_year >= 1000
    out_array << right_year if right_year / 100 + right_year % 100 == right_target && spread != 0 && right_year <= 9999
    spread += 1
  end

  out_array
end

test_year = 1978
p "Silly years closest to #{test_year} are: #{silly_years(test_year)}"
test_year = 2417
p "Silly years closest to #{test_year} are: #{silly_years(test_year)}"
test_year = 1208
p "Silly years closest to #{test_year} are: #{silly_years(test_year)}"
