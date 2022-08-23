//
//  Ingredients_V.swift
//  Gyros47
//
//  Created by finplif on 8/15/22.
//

import SwiftUI

struct Ingredients_V: View {
    
    @EnvironmentObject var ingredientsViewModal: Ingredients_VM
    
    @State var item: Ingredients_M
    @Binding var noneed : Array<String>
    
    var body: some View {

        HStack {
            Image(systemName: item.needed ? "checkmark.circle" : "circle")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(item.needed ? Color.green : Color.red)
                .onTapGesture {
                    self.item.needed.toggle()
                    noneed.append("no \(item.title)")
                }

            Text(item.title)
                .padding(.bottom, 5)
            Spacer()
        }
    }
}

//struct Ingredients_V_Previews: PreviewProvider {
//    static var item1 = Ingredients_M(title: "ingr1", needed: true)
//    static var previews: some View {
//        Ingredients_V(item: item1, noneed: $noneed)
//    }
//}
