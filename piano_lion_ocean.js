// Intialize Global Variables
let hungryPeople = 0;
let foodSupply = 10;

// Function to calculate the number of hungry people
function countHungryPeople() {
	hungryPeople = hungryPeople + Math.ceil(Math.random() * 10);
}

// Function to calculate the amount of food available
function countFoodSupply() {
	foodSupply = foodSupply + Math.ceil(Math.random() * 10);
}

// Function to add food to the food supply
function addFood(num) {
	foodSupply = foodSupply + num;
}

// Function to subtract food from the food supply
function subtractFood(num) {
	foodSupply = foodSupply - num;
}

// Function to give out food
function giveFood(num) {
	if (foodSupply > 0) {
		hungryPeople = hungryPeople - num;
		foodSupply = foodSupply - num;
	}
}

// Function to calculate the amount of food needed
function calculateFoodNeeded() {
	return Math.ceil(hungryPeople - foodSupply);
}

// Function to raise awareness of hunger in the world
function raiseAwareness() {
	console.log('Help fight hunger by donating to your local food bank!');
}

// Function to print the current status of the fight against hunger
function printStatus() {
	console.log('There are currently ' + hungryPeople + ' people who are hungry and ' + foodSupply + ' units of food available.');
}

// Function to check if the fight against hunger is over
function checkIfOver() {
	if (hungryPeople === 0) {
		console.log('Congratulations! We have won the fight against hunger!');
	}
}

// Main function that will run the fight against hunger
function fightHunger() {
	// Calculate the number of hungry people
	countHungryPeople();

	// Calculate the amount of food available
	countFoodSupply();

	// Print the current status of the fight against hunger
	printStatus();

	// Calculate the amount of food needed
	let foodNeeded = calculateFoodNeeded();

	// Add food to the food supply
	if (foodNeeded > 0) {
		addFood(foodNeeded);
	}

	// Give out food
	if (foodSupply > 0) {
		giveFood(foodSupply);
	}

	// Subtract food from the food supply
	if (foodSupply > 0) {
		subtractFood(foodSupply);
	}

	// Raise awareness
	raiseAwareness();

	// Check if the fight against hunger is over
	checkIfOver();
}