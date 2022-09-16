//
//  Confirmation_V.swift
//  Gyros47
//
//  Created by finplif on 8/27/22.
//

import SwiftUI

struct Confirmation_V: View {
    @EnvironmentObject var cart: Cart_VM
    @State private var isActive: Bool = false
    
    var body: some View {
        VStack{
            Text("Thank you!")
            Text("Your order will be ready in 10-15 mins")
            NavigationLink(
                isActive: $isActive,
                destination: {
                    Home_V()
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true)
                },
                label: {
                    Button(
                        action: {
                            isActive = true
                            cart.items = []
                        },
                        label: {
                            Text("Back to home page")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(height: 55)
                                .frame(maxWidth: 350)
                                .background(Color.red)
                                .cornerRadius(10)
                            
                        })
                })
            .buttonStyle(.plain)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct Confirmation_V_Previews: PreviewProvider {
    static var previews: some View {
        Confirmation_V()
    }
}
