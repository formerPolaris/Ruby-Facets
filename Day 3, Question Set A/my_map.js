// Prompt

// Implement the Array#map function in JavaScript.

// Polaris's solution

// For the otherwise unfamiliar, Ruby's Array instance method map takes the
// array from the instance and creates a new copy, upon each element of which a
// user-determined operation is performed.

// For example, [1,2,3].map {|element| element + 2} returns a new instance of
// Array containing [3,4,5].

// My implementation monkey patches the array prototype. While generally frowned
// upon, this solution could easily be duplicated without the prototype and is
// not intended for general use besides.

// This will accept a callback function that will be performed on each element
// of the array on which the method is called. It will return a new array
// containing each of the first array's elements processed by the callback.

// The callback must have a return value.

Array.prototype.myMap = function(callback) {
  var newArr = [];
  for(var i = 0; i < this.length; i++) {
    newArr.push(callback(this[i]));
  }
  return newArr;
};

a = [1,2,3].myMap(function(element) {
  return element + 5;
});

console.log(a);