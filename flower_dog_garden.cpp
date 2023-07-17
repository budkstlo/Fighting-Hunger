//Header files
#include<iostream>
#include<string>
#include<cmath>
#include<vector>
#include<map>

// Declaring functions
int donation_amount(int population);
void allocate_resources(int population, int resources);
void print_resources(std::map<std::string, int> resources);

// Main Function
int main()
{
	//Declaring Variables
	int population;
	std::map<std::string, int> resources;
 
	//Getting Data From User
	std::cout << "Enter the population of the area: ";
	std::cin >> population; 
 
	//Calling Functions
	donation_amount(population);
	allocate_resources(population, resources);
	print_resources(resources);
 
	return 0;
}

// Donation Amount function
int donation_amount(int population)
{
	int donation_amount;
 
	//Calculating Donation Amount
	donation_amount = (population / 1000) * 20;   
	std::cout << "Donation amount is: " << donation_amount << std::endl;
 
	return donation_amount;
}
// Allocate Resources Function
void allocate_resources(int population, std::map<std::string, int> &resources)
{
	// Calculating Resources
	resources["Rice"] = population *1.5; 
	resources["Wheat"] = population *1; 
	resources["Oil"] = population *0.5; 
	resources["Salt"] = population *0.1; 
	resources["Potatoes"] = population *2; 
	resources["Vegetables"] = population *2; 
	resources["Milk"] = population *0.2; 
	resources["Eggs"] = population *0.1; 
	resources["Fruits"] = population *1.2; 
}

// Printing Resources Function
void print_resources(std::map<std::string, int> resources)
{
	// Printing Resources
	std::cout << "Resources: " << std::endl;
	for (auto it = resources.begin(); it != resources.end(); it++)
		std::cout << it->first << " : " << it->second << std::endl;
}