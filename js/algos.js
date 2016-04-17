 // Release 0: Find the Longest Word

 function longestPhrase(arrayOfStrings) {
 	// Pseudocode:
 	// This function will return the longest phrase
 	// If two phrases are identical length,
 	// it'll return only the first
 	// 
 	// Declare string var called longestSoFar, initialize to ""
 	var longestSoFar = "";

  	// For each item,
  	for (var i = 0; i < arrayOfStrings.length; i++) {
  		// see if its length is longer than longestSoFar,
 		if (arrayOfStrings[i].length > longestSoFar.length) {
		  	// if so then push it into longestSoFar
		  	var longestSoFar = arrayOfStrings[i];
 		} else {
 			// do nothing
 		};
  	};
 	// At the end, return longestSoFar
 	return longestSoFar;
 }


 // Driver code

 // Test the function
var testArray = ["long phrase","longest phrases","longer phrase", "phrases longest"];
console.log("Our test array is: " + testArray)
console.log("The longest phrase is: " + longestPhrase(testArray));
