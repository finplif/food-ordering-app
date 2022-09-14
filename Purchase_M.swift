//
//  Purchase_M.swift
//  Gyros47
//
//  Created by finplif on 8/17/22.
//

import Foundation

struct Purchase_M: Identifiable, Codable {
    let id : String
    let name: String
    let title: String
    let ingredients : [String]
    let quantity : Int
    let paid : Bool
    let done : Bool
    
    init(
        id : String = UUID().uuidString,
        name: String,
        title: String,
        ingredients : [String],
        quantity : Int,
        paid : Bool,
        done : Bool)
    {
        self.id = id
        self.name = name
        self.title = title
        self.ingredients = ingredients
        self.quantity = quantity
        self.paid = paid
        self.done = done
    }
}
