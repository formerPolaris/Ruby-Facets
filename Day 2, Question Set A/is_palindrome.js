// Prompt

// Write a JavaScript function that takes a string and returns true if it's a
// palindrome, false if it's not. Use Javascript.

// AA notes on their version of the solution: This solution takes less time and
// memory than rebuilding the string backward and comparing the two. 

// Polaris's solution

// Progressively compare mirrored letters until mismatch
// or length/2 is reached. My solution ended up being virtually
// identical to AA's.

function isPalindrome(testString) {
  for(var i = 0; i < Math.floor(testString.length/2); i++) {
    if(testString[i] != testString[testString.length - 1 - i])
      return false;
  }
  return true;
};

console.log("\"racecar\" is a palindrome: " + isPalindrome("racecar"));
console.log("\"radar\" is a palindrome: " + isPalindrome("radar"));
console.log("\"flies\" is a palindrome: " + isPalindrome("flies"));
console.log("\"taranonarat\" is a palindrome: " + isPalindrome("taranonarat"));
console.log("\"ablewasiereisawelba\" is a palindrome: " + isPalindrome("ablewasiereisawelba"));