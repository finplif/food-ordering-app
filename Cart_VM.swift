//
//  Cart_VM.swift
//  Gyros47
//
//  Created by finplif on 8/15/22.
//

import Foundation
import SwiftUI

class Cart_VM: ObservableObject {
    @Published var items: [Cart_M] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
//        let newItems = [
//            ItemModel(title: "first dish", isCompleted: true),
//            ItemModel(title: "second dish", isCompleted: false),
//            ItemModel(title: "third dish", isCompleted: false),
//        ]
//
//        items.append(contentsOf: newItems)
        
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([Cart_M].self, from: data)
        else { return }
        
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func addItem(title: String, category: String, description: String, ingredients: [String], price: String, quantity: Int) {
        let newItem = Cart_M(title: title, category: category, description: description, ingredients: ingredients, price: price, quantity: quantity, expand: false)
        items.append(newItem)
    }
    
    func updateItem(item: Cart_M) {
        
        if let index = items.firstIndex(where: { (existingItem) -> Bool in
            return existingItem.id == item.id
        }) {
            items[index] = item.updateCompletetion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
