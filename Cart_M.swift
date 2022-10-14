//
//  Cart_M.swift
//  Gyros47
//
//  Created by finplif on 8/15/22.
//

import Foundation

struct Cart_M: Identifiable, Codable {
    let id : String
//    let image : String
    let title: String
    let category : String
    let description : String
    let ingredients : [String]
//    let rate : Int
    let price : Double
    let quantity : Int
    let expand : Bool
    
    init(id : String = UUID().uuidString,
//        image : String,
        title: String,
        category : String,
        description : String,
        ingredients : [String],
//        rate : Int,
        price : Double,
        quantity : Int,
        expand : Bool)
    {
        self.id = id
//        self.image = image
        self.title = title
        self.category = category
        self.description = description
        self.ingredients = ingredients
//        self.rate = rate
        self.price = price
        self.quantity = quantity
        self.expand = expand
    }
    
    func updateCompletetion() -> Cart_M {
        return Cart_M(id: id, title: title, category: category, description: description, ingredients: ingredients, price: price, quantity: quantity, expand: !expand)
    }
}

