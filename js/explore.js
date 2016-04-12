// Function that takes a string, and reverses it
function reverse(input) {
	// Declare empty 'reversed' string that will contain the input reversed
	var reversed = "";

	// Counting backwards, for each character
	for (var i = input.length - 1; i >= 0; i--) {
		// Add it to 'reversed'
		reversed = reversed + input[i];
	}

	// When done, return 'reversed'
	return reversed;
}

// Test the function
var testString = "hello";
var reversedString = reverse(testString);

// Should print out "olleh"
var time = true;
var money = true;
if (time == money) {
	console.log(reversedString);

} else {
	// do nothing
}