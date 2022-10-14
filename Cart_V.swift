//
//  Cart_V.swift
//  Gyros47
//
//  Created by finplif on 8/15/22.
//

import SwiftUI
import Firebase
import Stripe

struct Cart_V: View {
    
    var paymentIntentClientSecret: String?
    
    @EnvironmentObject var cartViewModal: Cart_VM
    @EnvironmentObject var dataManager: DataManager
    @State private var isActive: Bool = false
    
    @AppStorage("name") var currentUserName: String?
                
    private func startCheckout(completion: @escaping (String?) -> Void) {
        let url = URL(string: "https://gyros47-b0774.web.app/create-payment-intent")!

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try! JSONEncoder().encode(cartViewModal.items)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
                        
        guard let data = data, error == nil,
            (response as? HTTPURLResponse)?.statusCode == 200
        else {
            completion(nil)
            return
        }
                    
        let checkoutIntentResponse = try? JSONDecoder().decode(CheckoutIntentResponse.self, from: data)
        completion(checkoutIntentResponse?.clientSecret)
        }
        task.resume()
    }
    
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
//                                .onTapGesture {
//                                    cartViewModal.updateItem(item: item)
//                                }
                        }
                        .onDelete(perform: cartViewModal.deleteItem)
                    }
                    
                    VStack{
                        Spacer()
                        NavigationLink(
                            isActive: $isActive,
                            destination: {
                                CheckOut_V()},
                            label: {
                                Button(
                                    action: {
                                        isActive = true
                                        purchaseButtonPressed()
                                    },
                                    label: {Text("Checkout")
                                            .font(.title2)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                            .frame(height: 55)
                                            .frame(maxWidth: 350)
                                            .background(Color.red)
                                            .cornerRadius(10)})
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
        startCheckout { clientSecret in
            PaymentConfig.shared.paymentIntentClientSecret = clientSecret
            DispatchQueue.main.async {
                isActive = true
            }
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
            
            Text (numberformatter(value: item.price) ?? "")
                .bold()
        }
        .font(.title3)
        .padding(.vertical, 8)
    }
    
    func numberformatter(value: Double) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: value))
    }
}
