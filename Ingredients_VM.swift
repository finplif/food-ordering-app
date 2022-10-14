//
//  Ingredients_VM.swift
//  Gyros47
//
//  Created by finplif on 8/15/22.
//

import Foundation
import SwiftUI

class Ingredients_VM: ObservableObject {
    @Published var ingredients: [Ingredients_M] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([Ingredients_M].self, from: data)
        else { return }

        self.ingredients = savedItems
    }
    
    func updateItem(ingredient: Ingredients_M) {
        if let index = ingredients.firstIndex(where: { (existingItem) -> Bool in
            return existingItem.id == ingredient.id
        }) {
            ingredients[index] = ingredient.updateCompletetion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(ingredients) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }

}

