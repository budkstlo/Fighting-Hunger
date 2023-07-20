#include <iostream>
#include <string>
using namespace std;

// function prototypes for startGame and performAction
void startGame ();
void performAction (int action);

// global variable used during the game
int hungerLevel = 0;

int main() 
{
	cout << "Welcome to the fight hunger game!" << endl;
	
	startGame();
	
	string input = "";
	while (input != "quit")
	{
		cout << "What action do you want to perform?" << endl;
		getline (cin, input);
	
		// to exit the game
		if (input == "quit") {
			break;
		}
		
		// perform the action chosen by the player
		if (input == "feed") {
			performAction(1);
		} else if (input == "distribute") {
			performAction(2);
		} else if (input == "educate") {
			performAction(3);
		} else if (input == "raise awareness") {
			performAction(4);
		} else {
			cout << "That is not a valid action. Please try again." << endl;
		}
	}
	
	cout << "Thank you for playing!" << endl;
	
	return 0;
}

// starts the game by displaying current hunger level
void startGame() 
{
	cout << "The current hunger level is " << hungerLevel << endl;
	cout << "These are the actions you can perform:" << endl;
	cout << "\t- feed" << endl;
	cout << "\t- distribute" << endl;
	cout << "\t- educate" << endl;
	cout << "\t- raise awareness" << endl;
	cout << "Type 'quit' to exit." << endl;
}

// performs an action chosen by the player and displays new hunger level
void performAction(int action) 
{
	if (action == 1) {
		hungerLevel -= 10;
		cout << "You fed people in need and reduced the hunger level by 10" << endl;
	} else if (action == 2) {
		hungerLevel -= 5;
		cout << "You distributed food and reduced the hunger level by 5" << endl;
	} else if (action == 3) {
		hungerLevel -= 3;
		cout << "You educated people about food and reduced the hunger level by 3" << endl;
	} else if (action == 4) {
		hungerLevel -= 1;
		cout << "You raised awareness about hunger and reduced the hunger level by 1" << endl;
	}
	
	cout << "The current hunger level is " << hungerLevel << endl;
}