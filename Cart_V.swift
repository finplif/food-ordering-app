//
//  Cart_V.swift
//  Gyros47
//
//  Created by finplif on 8/15/22.
//

import SwiftUI
import Firebase

struct Cart_V: View {
    
    @EnvironmentObject var cartViewModal: Cart_VM
    @EnvironmentObject var purchaseViewModal: Purchase_VM
    @EnvironmentObject var dataManager: DataManager
    
    @AppStorage("name") var currentUserName: String?
    
    var body: some View {
        ZStack{
            if cartViewModal.items.isEmpty {
                Text("Your cart is empty")
                    .font(.title2)
            } else {
                ZStack{
                    List{
                        ForEach(cartViewModal.items) {item in
                            ListRowView(item: item)
                                .onTapGesture {
                                    cartViewModal.updateItem(item: item)
                                }
                        }
                        .onDelete(perform: cartViewModal.deleteItem)
                    }
                    VStack{
                        Spacer()
                        Button(
                            action: {purchaseButtonPressed()},
                            label: {
                                Text("Complete purchase")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(height: 55)
                                    .frame(maxWidth: 350)
                                    .background(Color.red)
                                    .cornerRadius(10)
                            })
                    }
                }
            }
        }
        .listStyle(PlainListStyle())
        .navigationBarTitle("My Cart")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func purchaseButtonPressed(){
        for item in cartViewModal.items {
            dataManager.purchaseButtonPressed(i_name: currentUserName ?? "", i_title: item.title, i_ingredients: item.ingredients, i_quantity: item.quantity, i_done: false)
                
                
//                title: item.title,
//                ingredients: item.ingredients,
//                quantity: Int(item.quantity))
        }
    }
}

struct Cart_V_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            Cart_V()
        }
        .environmentObject(Cart_VM())
        .environmentObject(Purchase_VM())
    }
}

struct ListRowView: View {
    
    let item: Cart_M
    
    var body: some View {
        HStack {
//            Image (systemName: item.expand ? "checkmark.circle" : "circle" )
//                .foregroundColor(item.expand ? .green : .red)
//            if let imagename = item.image {
//                Image(imagename)
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: 45, height: 45, alignment: .center)
//            }
            
            VStack(alignment: .leading){
                
                Text(item.title)
                    .bold()
                Text(item.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                ForEach(item.ingredients, id: \.self) {ingredient in
                    Text(ingredient)
                }
                
                if (item.quantity > 1){
                    Text ("\(item.quantity) items")
                } else {
                    Text ("\(item.quantity) item")
                }
            }
            .padding(.leading, 10)
            
            Spacer()
            
            Text (item.price)
                .bold()
        }
        .font(.title3)
        .padding(.vertical, 8)
    }
}
