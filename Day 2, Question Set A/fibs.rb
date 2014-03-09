# Prompt

# Write a function, fibs(num) which returns the first n elements from the
# fibonnacci sequence, given n.

# Polaris's solution

# As seen below...

def fibs(num)
  return case num
  when 0
    []
  when 1
    [0]
  when 2
    [0, 1]
  else
    base = fibs(num - 1)
    base.concat([base[-1] + base[-2]])
    base
  end
end

p fibs(0)
p fibs(1)
p fibs(2)
p fibs(3)
p fibs(4)
p fibs(5)
p fibs(6)
p fibs(7)
p fibs(8)
p fibs(9)
p fibs(10)
p fibs(11)