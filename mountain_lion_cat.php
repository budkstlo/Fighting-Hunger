<?php

// Create a function to retrieve a random number of meals from a MySQL database
function getRandomMeals($database) {
    $query = 'SELECT * FROM meals ORDER BY RAND() LIMIT 5;';
    $result = $database->query($query);
    return $result;
}

// Create a function to retrieve the total number of meals from a MySQL database
function getTotalMeals($database) {
    $query = 'SELECT COUNT(*) FROM meals;';
    $result = $database->query($query);
    return $result;
}

//Create a function to retrieve meals by type from a MySQL database
function getMealsByType($database, $type) {
    $query = "SELECT * FROM meals WHERE type = '$type';";
    $result = $database->query($query);
    return $result;
}

//Create a function to retrieve meals by cuisine from a MySQL database
function getMealsByCuisine($database, $cuisine) {
    $query = "SELECT * FROM meals WHERE cuisine = '$cuisine';";
    $result = $database->query($query);
    return $result;
}

// Create a function to insert a new meal into a MySQL database
function insertMeal($database, $name, $type, $cuisine, $ingredients, $instructions) {
    $query = "INSERT INTO meals (name, type, cuisine, ingredients, instructions)
    VALUES ('$name', '$type', '$cuisine', '$ingredients', '$instructions')";
    $result = $database->query($query);
    return $result;
}

// Create a function to update a meal in a MySQL database
function updateMeal($database, $name, $type, $cuisine, $ingredients, $instructions) {
    $query = "UPDATE meals SET type = '$type', cuisine = '$cuisine', ingredients = '$ingredients', instructions = '$instructions' 
    WHERE name = '$name'";
    $result = $database->query($query);
    return $result;
}

// Create a function to delete a meal from a MySQL database
function deleteMeal($database, $name) {
    $query = "DELETE FROM meals WHERE name = '$name'";
    $result = $database->query($query);
    return $result;
}

// Create a function to retrieve all meals from a MySQL database
function getAllMeals($database) {
    $query = 'SELECT * FROM meals;';
    $result = $database->query($query);
    return $result;
}

// Create a function to donate a meal to a person in need
function donateMeal($database, $mealName, $recipientName) {
    $query = "INSERT INTO donations (meal_name, recipient_name) 
    VALUES ('$mealName', '$recipientName')";
    $result = $database->query($query);
    return $result;
}

// Create a function to retrieve a donation from a MySQL database
function getDonation($database, $id) {
    $query = "SELECT * FROM donations WHERE id = '$id';";
    $result = $database->query($query);
    return $result;
}

// Create a function to retrieve all donations from a MySQL database
function getAllDonations($database) {
    $query = 'SELECT * FROM donations;';
    $result = $database->query($query);
    return $result;
}

// Create a function to delete a donation from a MySQL database
function deleteDonation($database, $id) {
    $query = "DELETE FROM donations WHERE id = '$id'";
    $result = $database->query($query);
    return $result;
}

// Create a function to calculate the total number of meals donated
function calculateTotalDonations($database) {
    $query = "SELECT COUNT(*) FROM donations;";
    $result = $database->query($query);
    return $result;
}

// Create a function to calculate the total number of meals donated to a specific recipient
function calculateTotalDonationsToRecipient($database, $recipientName) {
    $query = "SELECT COUNT(*) FROM donations WHERE recipient_name = '$recipientName';";
    $result = $database->query($query);
    return $result;
}

// Create a function to retrieve meals donated to a specific recipient
function getDonationsToRecipient($database, $recipientName) {
    $query = "SELECT * FROM donations WHERE recipient_name = '$recipientName';";
    $result = $database->query($query);
    return $result;
}

?>