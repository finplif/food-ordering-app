//
//  Purchase_VM.swift
//  Gyros47
//
//  Created by finplif on 8/17/22.
//

import Foundation

class Purchase_VM: ObservableObject {
    @Published var items: [Purchase_M] = [] {
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
            let savedItems = try? JSONDecoder().decode([Purchase_M].self, from: data)
        else { return }
        
        self.items = savedItems
    }
    
    func addItem(name: String, title: String, ingredients: [String], quantity: Int, done: Bool) {
        let newItem = Purchase_M(name: name, title: title, ingredients: ingredients, quantity: quantity, done: false)
        items.append(newItem)
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
