//
//  Ingredients_M.swift
//  Gyros47
//
//  Created by finplif on 8/15/22.
//

import Foundation

struct Ingredients_M: Identifiable, Codable {
    let id : String
    let title : String
    var needed : Bool
    
    init(id : String = UUID().uuidString,
        title: String,
        needed: Bool )
    {
        self.id = id
        self.title = title
        self.needed = needed
    }

    func updateCompletetion() -> Ingredients_M {
        return Ingredients_M(id: id, title: title, needed: !needed)
    }
}

