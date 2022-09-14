//
//  Cart_VM.swift
//  Gyros47
//
//  Created by finplif on 8/15/22.
//

import Foundation
import SwiftUI

class Cart_VM: ObservableObject {
    @Published var items: [Cart_M] = [Cart_M]() {
        didSet {
            saveItems()
        }
    }

    var cartTotal: Double {
        return items.reduce(0) { result, product in
            result + product.price
        }
    }

    var cartCount: Int {
        items.count
    }

    let itemsKey: String = "items_list"

    init() {
        getItems()
    }

    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([Cart_M].self, from: data)
        else { return }

        self.items = savedItems
    }

    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }

    func addItem(title: String, category: String, description: String, ingredients: [String], price: Double, quantity: Int) {
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


