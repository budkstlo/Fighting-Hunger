Public Class FightingHunger

    'Declare Variables 
    Dim numOfVolunteers As Integer 
    Dim tastyMeal As String 
    Dim donationAmount As Double 
    Dim donatedFood As String 
    Dim donatedClothing As String 
    Dim numOfHoursWorked As Integer

Sub Main()
     
    'Greet the User and Introduce the Program 
    Console.WriteLine("Welcome to the Fighting Hunger Program.") 
    Console.WriteLine("We are here to help those in need by providing meals, clothing, and services.") 
    Console.WriteLine("") 

'Prompt User for number of volunteers
    Console.Write("How many volunteers would you like to provide? ") 
    numOfVolunteers = Console.ReadLine 
    
    'Calculate amount of hours worked
    numOfHoursWorked = numOfVolunteers * 8

'Prompt User for Donation Amount
    Console.Write("What is your donation amount? ") 
    donationAmount = Console.ReadLine 
    
    'Determine type of Meal to provide 
    If donationAmount < 50 Then 
        tastyMeal = "PB&J Sandwich" 
    ElseIf donationAmount < 100 Then 
        tastyMeal = "Macaroni and Cheese"
    ElseIf donationAmount < 150 Then 
        tastyMeal = "Fried Chicken" 
    Else
        tastyMeal = "Steak"
    End If
    
'Prompt User for type of donated food 
    Console.Write("What food do you want to donate? ") 
    donatedFood = Console.ReadLine 

'Prompt User for type of donated clothing
    Console.Write("What type of clothing do you want to donate? ") 
    donatedClothing = Console.ReadLine 

'Display Summary of information 
    Console.WriteLine("")
    Console.WriteLine("Here is a summary of your information:")
    Console.WriteLine("Number of Volunteers: " & numOfVolunteers) 
    Console.WriteLine("Amount of Hours Worked: " & numOfHoursWorked) 
    Console.WriteLine("Donation Amount: " & donationAmount) 
    Console.WriteLine("Type of Meal: " & tastyMeal)
    Console.WriteLine("Type of Donated Food: " & donatedFood)
    Console.WriteLine("Type of Donated Clothing: " & donatedClothing)

'End Program
    Console.WriteLine("") 
    Console.WriteLine("Thank you for participating in the Fighting Hunger Program!") 
    Console.ReadKey()
    
End Sub 

End Class