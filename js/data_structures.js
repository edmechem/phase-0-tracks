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
