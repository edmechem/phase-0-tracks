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



// Release 1: Find a Key-Value Match

function findMatch(person1, person2) {
	// Pseudocode:
	// Presuming the objects are key/value pairs
	// Also presuming just two objects
	// thus, this is very specific code (not general)

	// Start off declaring returnValue boolean as false
	var returnValue = false;

	// Declare two objects with the info from these two objects, & compare
	//   (do I need to? may be able to just compare
	//   the two objects directly)

	// OK, I could do the easy thing & presume I know the values of the
	// two keys: "name" & "age". But let's say I don't. Then, I'll need to
	// loop thru each one, pulling these out.

	// Well actually, I can probably get number of keys per object?
	// Lemme research... Yep: 
	// http://www.hacksparrow.com/javascript-get-the-number-of-properties-in-an-object-without-looping.html
	// i.e.: var keysCount = Object.keys(person1).length;
	// OK that's nice, but we actually don't want that here.

	// We do actually want a loop, i.e. like the one in the
	// "Iterating over keys-values" section on this site:
	// http://javascript.info/tutorial/objects
	// for(key in obj) {
	//   ... obj[key] ...
	// }

	// So, we'll at least presume that the two objects
	// have the same key/value pairs, and we're comparing the values.
	// As an added bonus, the code is general enough
	// - it loops for however many keys there are -
	// that, it will continue to work even if we add more keys,
	// i.e. faveColor, astrologicalSign, etc.

	// OK, for each key
	for(var key in person1) {
		// Test code commented out

		// console.log("");
		// console.log("For the key: " + key);

		// var person1val = person1[key];
		// console.log("  Person 1 value: " + person1val);
		// var person2val = person2[key];
		// console.log("  Person 2 value: " + person2val);

		// We compare values, and if equal, set returnValue to true
		if (person1[key] == person2[key]) {
			// console.log("");
			// console.log("True, " + key + " is " + person1[key] + " for both.");
			var returnValue = true;
		};
	};
 
	// At end, return returnValue
	return returnValue
}



// Release 2: Generate Random Test Data

function generateRandomWords(howMany) {
	// Takes an int howMany, loops that many times, each loop generating
	// a word filled with random letters, of randomly varying length
	// from 1 to 10 characters

	// We need to figure out how to:
	// 
	//   - generate a random number from x to y (1 to 10, 1 to 26)
	// Oh how tedious. According to:
	//   http://www.w3schools.com/jsref/jsref_random.asp
	// we have to do like:
	//   Math.floor((Math.random() * 10) + 1);
	// to get ruby's simple & elegant rand(1..10)
	// OK, fine.
	// 
	//   - grab a character from a string, at some index value
	// Which is simple; charAt(x) where x is the index value


	// Pseudocode looks like this:

	// Declare empty array randomWords
	var randomWords = [];
	// Declare var theAlphabet of "abcdefghijklmnopqrstuvwxyz"
	var theAlphabet = "abcdefghijklmnopqrstuvwxyz";

	// For each of howMany
	// ha, had to use w here and c for inner loop. Using i for both = FAIL
	for (var w = 0; w < howMany; w++) {

	  //   Declare an empty var thisWord
	  var thisWord = "";
	  //   Declare a var wordLength, which is a random number from 1 thru 10
	  var wordLength = Math.floor((Math.random() * 10) + 1);
	  // console.log("Word length is " + wordLength);

	  //   for wordLength times,
	  for (var c = 0; c < wordLength; c++) {
	  //     Add character at index (rand 0..25) of theAlphabet, to thisWord
	    var theIndex = (Math.floor((Math.random() * 26) + 1) - 1)
	    thisWord = thisWord + theAlphabet.charAt(theIndex);
	    };

	  //   Add thisWord to randomWords
	  randomWords.push(thisWord);
	};

	// When done with all that, return randomWords
	return randomWords;
}




// Driver code 

// Test the longestPhrase function
var testArray = ["long phrase","longest phrases","longer phrase", "phrases longest"];
console.log("Our test array is: " + testArray)
console.log("The longest phrase is: " + longestPhrase(testArray));



// Test the findMatch function
var person1 = {name: "Steven", age: 52, faveColor: "blue", astrologicalSign: "Scorpio"};
var person2 = {name: "Tamir", age: 54, faveColor: "green", astrologicalSign: "Scorpio"};

// console.log("");
// console.log("Our first test person is: " + person1.name + ", age: " + person1.age);
// console.log("Our second test person is: " + person1.name + ", age: " + person1.age);
// for(var key in person1) {
//     var val = person1[key];
//     console.log("Key: " + key + " value:" + val);
// }
// console.log("Length of person1 is: " + Object.keys(person1).length);

console.log("");
console.log("Result of findMatch is: " + findMatch(person1, person2));



// Test the randomWords function

// Intro text
console.log("");
console.log("Ok, let's generate 10 arrays of 5 random words each.");
console.log("For each array of random words, we'll print it, then feed it to");
console.log("the 'longestPhrase' function, and print the result.");

// Set up for loop, to do this 10 times
for (var i = 0; i < 10; i++) {

	// Print one line of whitespace before each group
	console.log("");

	// Generate & print the 5 random words
	var myWords = generateRandomWords(5);
	console.log("For these 5 words: " + myWords);

	// Find & print the longest one of those 5
	var myLongest = longestPhrase(myWords);
	console.log("the longest one is: " + myLongest);
}
console.log("");
