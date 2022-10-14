//
//  AllFood_M.swift
//  Gyros47
//
//  Created by finplif on 8/15/22.
//

import Foundation

struct AllFood_M : Identifiable {
    var id = UUID().uuidString
//    let image : String
    let title : String
    let category : String
    let descrip : String
    let stars : Int
    let price : Double
    var ingredients : [Ingredients_M]
    let expand : Bool
}

var PickedFood: [AllFood_M] = [
    .init(
          title: "Super Gyro",
          category: "Gyro",
          descrip: "Served with fries",
          stars: 1,
          price: 12.99,
          ingredients: [
        Ingredients_M(title: "ingredient1", needed: true),
        Ingredients_M(title: "ingredient2", needed: true),
        Ingredients_M(title: "ingredient3", needed: true),
        ],
          expand: false),
    
    .init(
            title: "Chicken Wings 6pc",
            category: "Mains",
            descrip: "Served with fries",
            stars: 1,
            price: 11.99,
            ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
            expand: false),
    
        .init(
              title: "Regular Italian Beef",
              category: "Italian Beef",
              descrip: "Served with fries",
              stars: 3,
              price: 12.99,
              ingredients: [
            Ingredients_M(title: "ingredient", needed: true),
            Ingredients_M(title: "ingredient", needed: true),
            Ingredients_M(title: "ingredient", needed: true),
            ],
              expand: false),
    
        .init(
              title: "Philly Steak",
              category: "Original Philly Steak",
              descrip: "Served with cheese and fries",
              stars: 1,
              price: 11.99,
              ingredients: [
            Ingredients_M(title: "ingredient", needed: true),
            Ingredients_M(title: "ingredient", needed: true),
            Ingredients_M(title: "ingredient", needed: true),
            ],
              expand: false),
    
        .init(
              title: "Gyro and Steak Philly Mix",
              category: "Original Philly Steak",
              descrip: "Served with cheese and fries",
              stars: 1,
              price: 11.99,
              ingredients: [
            Ingredients_M(title: "ingredient", needed: true),
            Ingredients_M(title: "ingredient", needed: true),
            Ingredients_M(title: "ingredient", needed: true),
            ],
              expand: false),
]

var ItalianBeefFood: [AllFood_M] = [
    .init(
          title: "Regular Italian Beef",
          category: "Italian Beef",
          descrip: "Served with fries",
          stars: 3,
          price: 12.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Foot Long Italian Beef",
          category: "Italian Beef",
          descrip: "Served with fries",
          stars: 3,
          price: 18.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
        .init(
              title: "Italian Beef Combo",
              category: "Italian Beef",
              descrip: "Beef and sausage. Served with fries",
              stars: 4,
              price: 13.99,
              ingredients: [
            Ingredients_M(title: "ingredient", needed: true),
            Ingredients_M(title: "ingredient", needed: true),
            Ingredients_M(title: "ingredient", needed: true),
            ],
              expand: false),
    
        .init(
              title: "Italian Sausage",
              category: "Italian Beef",
              descrip: "Served with fries",
              stars: 5,
              price: 8.99,
              ingredients: [
            Ingredients_M(title: "ingredient", needed: true),
            Ingredients_M(title: "ingredient", needed: true),
            Ingredients_M(title: "ingredient", needed: true),
            ],
              expand: false),
    
        .init(
              title: "Gyro Italian Beef",
              category: "Italian Beef",
              descrip: "Italian beef with gyro meat. Served with fries",
              stars: 3,
              price: 14.99,
              ingredients: [
            Ingredients_M(title: "ingredient", needed: true),
            Ingredients_M(title: "ingredient", needed: true),
            Ingredients_M(title: "ingredient", needed: true),
            ],
              expand: false),
]

var MainsFood: [AllFood_M] = [
    .init(
          title: "Chicken Tenders 5pc",
          category: "Mains",
          descrip: "Served with fries",
          stars: 1,
          price: 10.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
        .init(
              title: "Chicken Tenders 7pc",
              category: "Mains",
              descrip: "Served with fries",
              stars: 3,
              price: 12.99,
              ingredients: [
            Ingredients_M(title: "ingredient", needed: true),
            Ingredients_M(title: "ingredient", needed: true),
            Ingredients_M(title: "ingredient", needed: true),
            ],
              expand: false),
    
        .init(
              title: "Chicken Tenders 9pc",
              category: "Mains",
              descrip: "Served with fries",
              stars: 3,
              price: 14.99,
              ingredients: [
            Ingredients_M(title: "ingredient", needed: true),
            Ingredients_M(title: "ingredient", needed: true),
            Ingredients_M(title: "ingredient", needed: true),
            ],
              expand: false),
    
        .init(
              title: "Chicken Nuggets 8pc",
              category: "Mains",
              descrip: "Served with fries",
              stars: 4,
              price: 9.99,
              ingredients: [
            Ingredients_M(title: "ingredient", needed: true),
            Ingredients_M(title: "ingredient", needed: true),
            Ingredients_M(title: "ingredient", needed: true),
            ],
              expand: false),
    
        .init(
              title: "Chicken Nuggets 12pc",
              category: "Mains",
              descrip: "Served with fries",
              stars: 5,
              price: 11.99,
              ingredients: [
            Ingredients_M(title: "ingredient", needed: true),
            Ingredients_M(title: "ingredient", needed: true),
            Ingredients_M(title: "ingredient", needed: true),
            ],
              expand: false),
    
        .init(
              title: "Chicken Nuggets 20pc",
              category: "Mains",
              descrip: "Served with fries",
              stars: 3,
              price: 18.99,
              ingredients: [
            Ingredients_M(title: "ingredient", needed: true),
            Ingredients_M(title: "ingredient", needed: true),
            Ingredients_M(title: "ingredient", needed: true),
            ],
              expand: false),
    
        .init(
              title: "Chicken Wings 6pc",
              category: "Mains",
              descrip: "Served with fries",
              stars: 1,
              price: 11.99,
              ingredients: [
            Ingredients_M(title: "ingredient", needed: true),
            Ingredients_M(title: "ingredient", needed: true),
            Ingredients_M(title: "ingredient", needed: true),
            ],
              expand: false),
    
        .init(
              title: "Chicken Wings 10pc",
              category: "Mains",
              descrip: "Served with fries",
              stars: 4,
              price: 16.99,
              ingredients: [
            Ingredients_M(title: "ingredient", needed: true),
            Ingredients_M(title: "ingredient", needed: true),
            Ingredients_M(title: "ingredient", needed: true),
            ],
              expand: false),
]

var FishDinnerFood: [AllFood_M] = [
    .init(
          title: "Cat Fish 3pc",
          category: "Fish Dinner",
          descrip: "Served with fries",
          stars: 5,
          price: 14.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Cat Fish 5pc",
          category: "Fish Dinner",
          descrip: "Served with fries",
          stars: 3,
          price: 16.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Perch 3pc",
          category: "Fish Dinner",
          descrip: "Served with fries",
          stars: 1,
          price: 14.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Perch 5pc",
          category: "Fish Dinner",
          descrip: "Served with fries",
          stars: 1,
          price: 16.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Jack Salmon 3pc",
          category: "Fish Dinner",
          descrip: "Served with fries",
          stars: 1,
          price: 14.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Small Shrimp",
          category: "Fish Dinner",
          descrip: "Served with fries",
          stars: 1,
          price: 11.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Jumbo Shrimp",
          category: "Fish Dinner",
          descrip: "Served with fries",
          stars: 1,
          price: 14.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
]

var FishComboFood: [AllFood_M] = [
    .init(
          title: "Perch 5pc + Cat Fish Mix",
          category: "Fish Combo",
          descrip: "5pc total",
          stars: 1,
          price: 18.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Five Fish + Ten Wings",
          category: "Fish Combo",
          descrip: "Served with fries",
          stars: 1,
          price: 29.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Fish Nuggets 8pc",
          category: "Fish Combo",
          descrip: "Served with fries",
          stars: 1,
          price: 12.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Fish Nuggets 12pc",
          category: "Fish Combo",
          descrip: "Served with fries",
          stars: 1,
          price: 16.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
]

var BurgersFood: [AllFood_M] = [
    .init(
          title: "Hamburger",
          category: "Burgers",
          descrip: "No cheese. Served with fries",
          stars: 1,
          price: 7.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Double Cheese Burger",
          category: "Burgers",
          descrip: "Served with fries",
          stars: 1,
          price: 11.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Triple Cheese Burger",
          category: "Burgers",
          descrip: "Served with fries",
          stars: 1,
          price: 14.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Chop Steak",
          category: "Burgers",
          descrip: "With cheese. Served with fries",
          stars: 1,
          price: 10.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Double Chop Steak",
          category: "Burgers",
          descrip: "With cheese. Served with fries",
          stars: 1,
          price: 13.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Chop Steak with Gyro Meat",
          category: "Burgers",
          descrip: "With gyro meat. Served with fries",
          stars: 1,
          price: 12.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Chicken Sandwich",
          category: "Burgers",
          descrip: "Served with fries",
          stars: 1,
          price: 7.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Double Chicken Sandwich",
          category: "Burgers",
          descrip: "Served with fries",
          stars: 1,
          price: 9.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Fish Sandwich",
          category: "Burgers",
          descrip: "Served with fries",
          stars: 1,
          price: 7.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Double Fish Sandwich",
          category: "Burgers",
          descrip: "Served with fries",
          stars: 1,
          price: 9.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Beef and Bacon Cheese Burger",
          category: "Burgers",
          descrip: "Served with fries",
          stars: 1,
          price: 9.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Double Beef and Bacon Cheese Burger",
          category: "Burgers",
          descrip: "descr",
          stars: 1,
          price: 11.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
]

var OriginalPhillySteakFood: [AllFood_M] = [
    .init(
          title: "Philly Steak",
          category: "Original Philly Steak",
          descrip: "Served with cheese and fries",
          stars: 1,
          price: 11.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Gyro Philly",
          category: "Original Philly Steak",
          descrip: "Served with cheese and fries",
          stars: 1,
          price: 9.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Itallian Philly",
          category: "Original Philly Steak",
          descrip: "Served with cheese and fries",
          stars: 1,
          price: 9.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Gyro and Steak Philly Mix",
          category: "Original Philly Steak",
          descrip: "Served with cheese and fries",
          stars: 1,
          price: 11.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Super Philly Mix",
          category: "Original Philly Steak",
          descrip: "Served with cheese and fries. Please, specify meat",
          stars: 1,
          price: 15.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
]

var SubmarineSandwichesFood: [AllFood_M] = [
    .init(
          title: "Roasted Beef Sandwich",
          category: "Submarine Sandwiches",
          descrip: "Served with cheese and fries. Includes lettuce, tomato, onion, cheese, and dressing",
          stars: 1,
          price: 9.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Jim SHoe Sandwich",
          category: "Submarine Sandwiches",
          descrip: "Roast, corned, and gyro meat. Served with cheese and fries. Includes lettuce, tomato, onion, cheese, and dressing",
          stars: 1,
          price: 12.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
]

var SaladsFood: [AllFood_M] = [
    .init(
          title: "Gyro Salad",
          category: "Salads",
          descrip: "Salad with Gyro meat. Ranch and Gyro sauce on the side",
          stars: 1,
          price: 11.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
]

var HotandPolishFood: [AllFood_M] = [
    .init(
          title: "Beef Polish",
          category: "Hot and Polish",
          descrip: "Served with fries",
          stars: 1,
          price: 7.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Foot Long Polish",
          category: "Hot and Polish",
          descrip: "Served with fries",
          stars: 1,
          price: 13.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
]

var MixandMatchFood: [AllFood_M] = [
    .init(
          title: "Super Gyro Sandwich",
          category: "Mix and Match",
          descrip: "Served with fries",
          stars: 1,
          price: 12.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Double Gyro Cheese Burger",
          category: "Mix and Match",
          descrip: "Served with fries",
          stars: 1,
          price: 12.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Gyro Philly Large",
          category: "Mix and Match",
          descrip: "",
          stars: 1,
          price: 14.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Super Philly Steak",
          category: "Mix and Match",
          descrip: "Served with fries",
          stars: 1,
          price: 12.99,
          ingredients: [
        Ingredients_M(title: "apple", needed: true),
        Ingredients_M(title: "cheese", needed: true),
        Ingredients_M(title: "cheese", needed: true)
        ],
          expand: false),

    .init(
          title: "Regular Jim Shoe",
          category: "Mix and Match",
          descrip: "Served with fries",
          stars: 1,
          price: 12.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
          ],
          expand: false),
]

var SidesFood: [AllFood_M] = [
    .init(
          title: "French Fries",
          category: "Sides",
          descrip: "descr",
          stars: 1,
          price: 3.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Cheese Fries",
          category: "Sides",
          descrip: "descr",
          stars: 1,
          price: 4.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Mozzarella Sticks 6pc",
          category: "Sides",
          descrip: "Served with fries",
          stars: 1,
          price: 8.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Mozzarella Sticks 10pc",
          category: "Sides",
          descrip: "Served with fries",
          stars: 1,
          price: 9.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Beef Pizza Puff",
          category: "Sides",
          descrip: "",
          stars: 1,
          price: 5.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Two Beef Pizza Puff",
          category: "Sides",
          descrip: "Served with fries",
          stars: 1,
          price: 9.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Beef Pizza Puff with Fries",
          category: "Sides",
          descrip: "Served with fries",
          stars: 1,
          price: 6.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Onion Rings",
          category: "Sides",
          descrip: "",
          stars: 1,
          price: 3.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Mushrooms",
          category: "Sides",
          descrip: "",
          stars: 1,
          price: 3.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Fried Okra",
          category: "Sides",
          descrip: "",
          stars: 1,
          price: 3.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
]

var GyroFood: [AllFood_M] = [
    .init(
          title: "Super Gyro",
          category: "Gyro",
          descrip: "Served with fries",
          stars: 1,
          price: 12.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
     
    .init(
          title: "Gyro Dinner",
          category: "Gyro",
          descrip: "Served with extra meat, two pitas and fries",
          stars: 1,
          price: 18.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Gyro Cheese Burger",
          category: "Gyro",
          descrip: "",
          stars: 1,
          price: 10.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Double Gyro Cheese Burger",
          category: "Gyro",
          descrip: "",
          stars: 1,
          price: 12.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Chicken Sandwich with Gyro Meat",
          category: "Gyro",
          descrip: "Served with gyro meat and fries",
          stars: 1,
          price: 11.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Gyro Italian Beef",
          category: "Gyro",
          descrip: "Served with gyro meat",
          stars: 1,
          price: 12.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Gyro Sub",
          category: "Gyro",
          descrip: "Served with cheese",
          stars: 1,
          price: 11.99,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
]

var BeveragesFood: [AllFood_M] = [
    .init(
          title: "Seven Up Can",
          category: "Beverages",
          descrip: "",
          stars: 1,
          price: 1.50,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "RC Can",
          category: "Beverages",
          descrip: "",
          stars: 1,
          price: 1.50,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Pink Lemonade Pop Can",
          category: "Beverages",
          descrip: "",
          stars: 1,
          price: 1.50,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Fruit Punch Pop Can",
          category: "Beverages",
          descrip: "",
          stars: 1,
          price: 1.50,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Ginger Ale Can",
          category: "Beverages",
          descrip: "",
          stars: 1,
          price: 1.50,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Dr. Pepper Can",
          category: "Beverages",
          descrip: "",
          stars: 1,
          price: 1.50,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Grape Pop Can",
          category: "Beverages",
          descrip: "",
          stars: 1,
          price: 1.50,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Orange Pop Can",
          category: "Beverages",
          descrip: "",
          stars: 1,
          price: 1.50,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Strawberry Pop Can",
          category: "Beverages",
          descrip: "",
          stars: 1,
          price: 1.50,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "RC 1 liter Bottle",
          category: "Beverages",
          descrip: "",
          stars: 1,
          price: 2.50,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Seven Up 1 liter Bottle",
          category: "Beverages",
          descrip: "",
          stars: 1,
          price: 2.50,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Ginger Ale 1 liter Bottle",
          category: "Beverages",
          descrip: "",
          stars: 1,
          price: 2.50,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
    
    .init(
          title: "Orange Pop 1 liter Bottle",
          category: "Beverages",
          descrip: "",
          stars: 1,
          price: 2.50,
          ingredients: [
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        Ingredients_M(title: "ingredient", needed: true),
        ],
          expand: false),
]

