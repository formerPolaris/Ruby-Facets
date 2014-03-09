# Prompt

# Write a function, common_substrings(str1, str2) that takes two strings and
# returns the longest common substring.

# Polaris's solution

# This program works by first checking the longest possible substring in the
# shorter of the two strings against the entire longer string. If no match is
# found, each substring of length (shorter string's length) - 1 is checked
# against the entire longer string.

# This process is repeated until a match is found or until there is nothing left
# to check, in which case a blank string is returned.

def common_substrings(str1, str2)
  longer = (str1.length >= str2.length) ? str1 : str2
  shorter = (str1.length >= str2.length) ? str2 : str1

  sublength = shorter.length
  
  s_index = 0
  while sublength > 1
    longer.split("").each_index do |l_index|
      short_substring = shorter[s_index..sublength - 1 + s_index]
      break if short_substring.length > longer[l_index..-1].length
      long_substring = longer[l_index..sublength - 1 + l_index]
      return short_substring if short_substring == long_substring
    end

    if sublength + 1 > shorter[s_index..-1].length
      s_index = 0
      sublength -= 1
    else
      s_index += 1
    end
  end

  nil
end

p "The longest common substring between egg and eggplant is #{common_substrings("egg", "eggplant")}."
p "The longest common substring between clclclclgrapesgegegeg and grapes of fury is #{common_substrings("clclclclgrapesgegegeg", "grapes of fury")}."
p "The longest common substring between supercalifragilisticexpealidocious and super fragile - must be italian is #{common_substrings("supercalifragilisticexpealidocious", "super fragile - must be italian")}."