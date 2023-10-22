//
//  FoodTableViewController.swift
//  Meal Tracker
//
//  Created by Lars Dansie on 10/22/23.
//

import UIKit

class FoodTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var meals: [Meal] {
        var breakfast = Meal(name: "Breakfast", food: [
            Food(name: "Toast", description: "Bread but it got hot"),
            Food(name: "Cold Pizza", description: "What you had for dinner the previous night but now it's cold"),
            Food(name: "Reese's Puffs", description: "Peanut Butter Chocolate Flavor")
        ])
        
        var lunch = Meal(name: "Lunch", food: [
            Food(name: "Ham Sandwich", description: "A classic staple of the American Dream"),
            Food(name: "Chicken Nuggets", description: "The glue that holds our society"),
            Food(name: "Yellow Curry", description: "This stuff slaps")
        ])
        
        var dinner = Meal(name: "Dinner", food: [
            Food(name: "Spaghetti", description: "Your best attempt at impressing your date with a home-cooked meal"),
            Food(name: "Pizza", description: "Fresh slice of pepperoni"),
            Food(name: "Steak", description: "'Cause meat")
        ])

        return [breakfast, lunch, dinner]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let meal = meals[section]
        return meal.food.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)
        let meal = meals[indexPath.section]
        let food = meal.food[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = food.name
        content.secondaryText = food.description

        cell.contentConfiguration = content

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
    }
    
}
