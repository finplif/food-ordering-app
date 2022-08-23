//
//  Boarding_M.swift
//  Gyros47
//
//  Created by finplif on 8/15/22.
//

import Foundation

struct Boarding_M : Identifiable {
    var id : Int
    var image : String
    var title : String
    var descrip : String
}

var Data = [
    Boarding_M(id: 0, image: "welcome", title: "Welcome to Gyros47", descrip: "WE NEED FAHAD TO SAY SOMETHING HERE"),
    Boarding_M(id: 1, image: "choose", title: "Choose a Tasty Dish", descrip: "We make it simple to find the food you crave. Enter your  home addresse and let us do the rest."),
    Boarding_M(id: 2, image: "pick", title: "Your Food is on the way", descrip: "We make it simple to find the food you crave. Enter your  home addresse and let us do the rest.")
]
