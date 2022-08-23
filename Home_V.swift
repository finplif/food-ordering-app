//
//  Home_V.swift
//  Gyros47
//
//  Created by finplif on 8/15/22.
//

import SwiftUI

struct Home_V: View {
    
    @State var SelectedOption: CategoryBar_M = .ItalianBeef
    @State var CurrentOption: CategoryBar_M = .ItalianBeef
    
    var body: some View {

// Card View

        NavigationView{
            VStack {
                Divider()
                
                HStack {
                    Spacer()
                    
                    Text("Gyros47")
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.leading)
                    .padding(.vertical, 15)
                    
                    Spacer()
                }
                
                CategoryBar_V(SelectedOption: $SelectedOption, CurrentOption: $CurrentOption)
                    .overlay(
                        Divider()
                        .padding(.horizontal, -16), alignment: .bottom
                    )
                    .padding(.trailing, 25)
                
                ScrollViewReader {proxy in
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            ForEach(CategoryBar_M.allCases, id: \.self) {option in
                                Category_V(option: option, CurrentOption: $CurrentOption)
                            }
                        }
                        .onChange(of: SelectedOption, perform: {_ in
                            withAnimation(.easeInOut) {
                                        proxy.scrollTo(SelectedOption, anchor: .topTrailing)
                            }
                        })
                    }
                    .coordinateSpace(name: "scroll")
                }
                .shadow(radius: 1)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading:
                    NavigationLink(
                        destination: Account_V(),
                        label: {Image(systemName: "person.fill")})
                    .buttonStyle(PlainButtonStyle()),
                trailing:
                    NavigationLink(
                        destination: Cart_V(),
                        label: {Image(systemName: "cart.fill")})
                    .buttonStyle(PlainButtonStyle()))
        }
    }
}

struct Home_V_Previews: PreviewProvider {
    static var previews: some View {
        Home_V()
    }
}

