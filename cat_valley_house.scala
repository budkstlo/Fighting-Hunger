//Create the following methods to fight hunger

//1) Establish a Food Bank

def createFoodBank(): Unit = {
  val foodBank = List("Canned Goods", "Fresh Fruits & Vegetables", 
                      "Grains & Starches", "Proteins & Dairy")
  println("Food Bank has been established.")
  println("Food Bank has the following items available:")
  foodBank.foreach(println) 
}

//2) Obtain Donations

def obtainDonations(): Unit = {
  println("Accepting donations of canned goods, fresh fruits & vegetables, grains & starches, and proteins & dairy.")
  println("Donations can be dropped off at the local food Bank.")
}

//3) Create a Meal Plan and Shopping List

def createMealPlan(foodBank: List[String]): Unit = {
  val mealPlan = List(foodBank(0), foodBank(1), foodBank(2), foodBank(3))
  println("Meal Plan and Shopping list has been created:")
  mealPlan.foreach(println)
}

//4) Organize a Food Drive

def organizeFoodDrive(): Unit = {
  println("Organizing a food drive to obtain additional donations.")
  println("Accepting all non-perishable items.")
  println("Donations can be dropped off at the local food Bank.")
}

//5) Raise Awareness

def raiseAwareness(): Unit = {
  println("Distributing flyers and informational materials to raise awareness of hunger.")
  println("Asking people to donate money, time, and food.")
  println("Continually emphasizing the importance of assisting the community.")
}

//6) Promote Community Involvement

def promoteCommunityInvolvement(): Unit = {
  println("Encouraging others to volunteer at the food Bank to sort, package and distribute food to individuals and families in need.")
  println("Organizing educational seminars and workshops to teach people how to cook healthy meals.")
}

//7) Develop Strategies to Combat Hunger

def developStrategiesToCombatHunger(): Unit = {
  println("Creating initiatives to combat hunger such as food stamps and free meals programs.")
  println("Partnering with local restaurants, supermarkets, and farmers to create access points for donating and receiving food.")
  println("Reaching out to policy makers to create legislation that will increase access to nutritious food.")
}

//8) Educate About the Impacts of Hunger

def educateImpactsOfHunger(): Unit = {
  println("Creating educational tools to talk about hunger and its effects.")
  println("Using social media to spread awareness.")
  println("Providing opportunities for people to learn about how hunger impacts their lives and communities.")
}

//9) Offer Support to Those in Need

def offerSupport(): Unit = {
  println("Providing resources to individuals and families in need.")
  println("Connecting people to services and programs that will help them.")
  println("Organizing support networks and programs that help individuals and families in need.")
}

//10) Create Sustainable Solutions

def createSustainableSolutions(): Unit = {
  println("Partnering with local organizations to create urban farming initiatives.")
  println("Implementing community gardens and farmers markets to increase access to healthy food.")
  println("Establishing sustainable food systems that support local farmers and businesses.")
}

//Run Program

println("Fighting Hunger...")
createFoodBank()
obtainDonations()
createMealPlan(foodBank)
organizeFoodDrive()
raiseAwareness()
promoteCommunityInvolvement()
developStrategiesToCombatHunger()
educateImpactsOfHunger()
offerSupport()
createSustainableSolutions()
println("Finished Fighting Hunger.")