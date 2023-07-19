// This is a program written in Rust designed to help fight hunger.

// Imports
use std::io; // To get input from the user.
use std::time::{Duration}; // To delay output.

fn main() {
    
    // Variables
    let mut meals_left = 0; // To keep track of the meals left
    let mut total_meals = 0; // To keep track of total meals donated
    
    // Welcome message
    println!("Welcome to the Hunger Fighter!");
    println!("We are fighting hunger today!\n");
    
    // Main loop
    loop {
        
        // Get user input
        println!("Please enter the number of meals you would like to donate:");
        let mut input = String::new();
        io::stdin().read_line(&mut input)
            .expect("Failed to read line");
        let input: u32 = match input.trim().parse() {
            Ok(num) => num,
            Err(_) => {
                println!("Please enter a valid number");
                continue
            }
        };
        
        // Calculate meals left
        meals_left = meals_left + input;
        total_meals += input;
        
        // Output
        println!("You have donated {} meals!", meals_left);
        println!("Total meals donated: {}", total_meals);
        
        // Delay
        println!("\nPlease wait while we process your donation...");
        std::thread::sleep(Duration::from_secs(2));
        println!("Thanks for your donation!\n");
            
        // Exit if 1000 meals
        if meals_left == 1000 {
            break;
        }
    }
    
    // Output
    println!("Congratulations! You have helped fight hunger!\n");
    println!("Total meals donated: {}", total_meals);
    println!("Thank you for your generous donations!");
}