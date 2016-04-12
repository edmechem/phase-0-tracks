// 7.2 Pair - Ed Mechem & Nick Bushell


// Make some arrays
var colors = ["red", "green", "blue", "violet"]
var names = ["Edward", "Edwin", "Edmund", "Edgar"]

// Test initial arrays
console.log(colors);
console.log(names);

// Push some new values
colors.push("silver");
names.push("Eduardo");

// Test new arrays
console.log("");
console.log(colors);
console.log(names);


// Combine values in both arrays, into one object
var horses = {}
for (var i = 0; i < colors.length; i++) {
	var name = names[i];
	var color = colors[i];
	horses[name] = color;
}

console.log("");
console.log(horses);
console.log("");



// Release 2: Many Objects

// Car function
function Car(model, color) {
	
	this.model = model;	
	this.color = color;

	this.honk = function() {
		console.log("Beep beep!");
	}

	console.log("Car initialization complete...");
}


// Driver code to test
console.log("");
console.log("Let's build a car...");
var newCar = new Car("Model T", "black");

// Test whether this car exists...
console.log(newCar);

// Test whether this car can beep!
newCar.honk();

// Make another car
console.log("");
console.log("Let's build another car...");
var otherCar = new Car("Cadillac", "gold");

// Test whether this car exists...
console.log(otherCar);