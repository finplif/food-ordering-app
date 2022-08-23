//
//  Tab_V.swift
//  Gyros47
//
//  Created by finplif on 8/15/22.
//

import SwiftUI

struct Tab_V: View {
    var body: some View {
        HStack{
            VStack {
                Image(systemName: "list.bullet")
                Text("Orders")
            }
            VStack{
                Image(systemName: "cart.fill")
                Text("Order")
            }
            
            
            VStack {
                Image(systemName: "house")
                Text("Home")
            }
            
            VStack{
                Image(systemName: "person.fill")
                Text("Account")
            }
        }
    }
}

struct Tab_V_Previews: PreviewProvider {
    static var previews: some View {
        Tab_V()
    }
}

