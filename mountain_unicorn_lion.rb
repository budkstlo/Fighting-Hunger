# Create a class to represent the fight against hunger
class FightHunger 

  # Define a method to create a donation form for users
  def create_form 
    puts 'Please enter your name and email address:'
    name = gets.chomp
    email = gets.chomp
    
    puts 'Thank you. Please enter the amount you would like to donate.'
    amount = gets.chomp
    
    # Create a hash to store the information
    donation = {name: name, email: email, amount: amount}
    
    # Return the hash
    donation
  end

  # Define a method to process the donations
  def process_donations(donations)
    # Iterate through the donations
    donations.each do |donation|
      # Get the details
      name = donation[:name]
      email = donation[:email]
      amount = donation[:amount]
      
      # Process the donation by sending it to the charity
      send_donation(name, email, amount)
    end
  end

  # Define a method to send the donations to the charity
  def send_donation(name, email, amount)
    # Create a connection to the charity's API
    connection = CharityAPI.new
    # Send the donation to the charity
    connection.send_donation(name, email, amount)
  end
end

# Create an instance of the FightHunger class
fight_hunger = FightHunger.new

# Create an array of donations
donations = []

# Ask the user for donations 5 times
5.times do 
    # Get the donation information
    donation = fight_hunger.create_form
    # Add the donation to the array
    donations << donation
end

# Process the donations
fight_hunger.process_donations(donations)

# Print a thank you message
puts 'Thank you for your generous donations. Your support is helping to fight hunger!'