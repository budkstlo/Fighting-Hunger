import java.util.ArrayList; 
import java.util.List; 

public class FightingHunger { 

    //Declare global variables 
    private static List<FoodDistribution> foodDistributions; 
    private static List<FoodBank> foodBanks; 

    public static void main(String[] args) { 
        //Create a list of food distributions 
        foodDistributions = new ArrayList<FoodDistribution>(); 

        //Create a list of food banks 
        foodBanks = new ArrayList<FoodBank>(); 

        //Populate the list of food distributions 
        foodDistributions.add(new FoodDistribution("Farmers Market", "Fruits and Vegetables")); 
        foodDistributions.add(new FoodDistribution("Grocery Store", "Non-Perishable Items")); 
        foodDistributions.add(new FoodDistribution("Food Pantry", "Prepared Meals")); 

        //Populate the list of food banks 
        foodBanks.add(new FoodBank("Feeding America", "Nationwide")); 
        foodBanks.add(new FoodBank("Second Harvest", "California")); 
        foodBanks.add(new FoodBank("Feeding the West", "Oregon")); 

        //Loop over the food distributions and create partnerships between the food banks and the distributions 
        for (FoodDistribution distribution : foodDistributions) { 
            for (FoodBank bank : foodBanks) { 
                distributeFood(distribution, bank); 
            } 
        } 

        //Print the list of food banks and associated distributions 
        for (FoodBank bank : foodBanks) { 
            System.out.println(bank.getName()); 
            for (FoodDistribution distribution : bank.getDistributions()) { 
                System.out.println("\t" + distribution.getName() + " - " + distribution.getType()); 
            } 
        } 
    } 

    //Method to create a partnership between a food bank and a food distribution 
    public static void distributeFood(FoodDistribution distribution, FoodBank bank) { 
        bank.addDistribution(distribution); 
    } 

} 

//FoodDistribution class 
class FoodDistribution { 

    //Declare class properties 
    private String name; 
    private String type; 

    //Constructor method 
    public FoodDistribution(String name, String type) { 
        this.name = name; 
        this.type = type; 
    } 

    //Getters for name and type 
    public String getName() { 
        return name; 
    } 

    public String getType() { 
        return type; 
    } 
} 

//FoodBank class 
class FoodBank { 

    //Declare class properties 
    private String name; 
    private List<FoodDistribution> distributions; 
    private String location; 

    //Constructor method
    public FoodBank(String name, String location) { 
        this.name = name; 
        this.location = location; 
        this.distributions = new ArrayList<FoodDistribution>(); 
    } 

    //Add a food distribution to the list of food bank distributions 
    public void addDistribution(FoodDistribution distribution) { 
        distributions.add(distribution); 
    } 

    //Getters for name and distributions 
    public String getName() { 
        return name; 
    } 

    public List<FoodDistribution> getDistributions() { 
        return distributions; 
    } 
}