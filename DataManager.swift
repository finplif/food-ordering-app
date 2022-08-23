//
//  DataManager.swift
//  Gyros47
//
//  Created by finplif on 8/16/22.
//

import Foundation
import Firebase

class DataManager: ObservableObject {
    @Published var cart: [Purchase_M] = []
    
    init() {
        fetchPurchase()
    }
    
    func fetchPurchase() {
        cart.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Gyros47")
        ref.getDocuments{snapshot, error in
            guard error  == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let name = data["name"] as? String ?? ""
                    let title = data["title"] as? String ?? ""
                    let ingredients = data["ingredients"] as? [String] ?? [""]
                    let quantity = data["quantity"] as? Int ?? 0
                    let done = data["done"] as? Bool ?? false
                    
                    let item = Purchase_M(id: id, name: name, title: title, ingredients: ingredients, quantity: quantity, done: done)
                    self.cart.append(item)
                }
            }
        }
        
    }
    
    func purchaseButtonPressed(i_name: String, i_title: String, i_ingredients: [String], i_quantity: Int, i_done : Bool) {
        let db = Firestore.firestore()
        let ref = db.collection("Gyros47").document(i_title)
        ref.setData(["name": i_name, "title": i_title, "ingredients": i_ingredients, "quantity": i_quantity, "done": i_done]) { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}
