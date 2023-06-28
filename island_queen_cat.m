% 'Fighting Hunger' with MATLAB

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   1. Set up necessary variables and parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Dimension of the problem
n_countries = 10;

% Variables to store the data
food_supply_per_country = zeros(n_countries,1);
food_demand_per_country = zeros(n_countries,1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   2. Load data set from CSV file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Load the food supply and demand per country
[id, name, food_supply, food_demand] = ...
    importdata('hunger_data.csv',',',1);

for i = 1:n_countries
    food_supply_per_country(i) = food_supply(i);
    food_demand_per_country(i) = food_demand(i);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   3. Calculate food deficit/surplus for each country
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

food_deficit_surplus_per_country = ...
    food_supply_per_country - food_demand_per_country;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   4. Calculate total food deficit/surplus for all countries
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

total_food_deficit_surplus = sum(food_deficit_surplus_per_country);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   5. Plot the total food deficit/surplus per country
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Create a figure for plotting
figure(1);

% Plot the total food deficit/surplus for each country
bar(food_deficit_surplus_per_country)
title('Total Food Deficit/Surplus Per Country')
xlabel('Country')
ylabel('Food Deficit/Surplus (in tons)')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   6. Calculate the total food transfer needed
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calculate the total food transfer needed to balance food
% supply and demand
total_food_transfer = ...
    abs(total_food_deficit_surplus) / 2;
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   7. Calculate the food transfer for each country
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calculate the food transfer for each country in order
% to balance food supply and demand
food_transfer_per_country = ...
    food_deficit_surplus_per_country / 2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   8. Plot the food transfer per country
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Create a new figure for plotting
figure(2);

% Plot the food transfer per country
bar(food_transfer_per_country)
title('Food Transfer Per Country')
xlabel('Country')
ylabel('Food Transfer (in tons)')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   9. Create an adjacency matrix for food distribution
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Initialize the adjacency matrix
adjacency_matrix = zeros(n_countries,n_countries);

% Calculate the adjacency matrix for food distribution
for i = 1:n_countries
    for j = 1:n_countries
        if food_transfer_per_country(i) < 0 && ...
           food_transfer_per_country(j) > 0
            adjacency_matrix(i,j) = ...
                min(abs(food_transfer_per_country(i)), ...
                    food_transfer_per_country(j));
        end 
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   10. Link countries that need food with those who have it 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Find the countries that need food
countries_in_need = find(food_transfer_per_country < 0);

% Find the countries that have food
countries_with_food = find(food_transfer_per_country > 0);

% Link the countries that need with those who have it
for i = 1:length(countries_in_need)
    for j = 1:length(countries_with_food)
        adjacency_matrix(countries_in_need(i), countries_with_food(j)) = ...
            min(abs(food_transfer_per_country(countries_in_need(i))), ...
                food_transfer_per_country(countries_with_food(j)));
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   11. Plot the food distribution network
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Create a new figure for plotting
figure(3);

% Plot the food transfer network
gplot(adjacency_matrix, [food_supply; food_demand]', 'o-')
title('Food Transfer Network')
axis([0 1.2 0 1.2])
xlabel('Food Supply (in tons)')
ylabel('Food Demand (in tons)')