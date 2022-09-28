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
    @Environment (\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            VStack {
                HStack{
                    NavigationLink(
                        destination: Account_V(registrationViewModal: Registration_VM()),
                        label: {
                            Image(systemName: "person.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .padding(.top, 15)
                        })
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: Cart_V(),
                        label: {
                            Image(systemName: "cart.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .padding(.top, 15)
                        })
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.horizontal, 20)
                
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
                HStack{
                    Button(
                        action: {
                            presentationMode.wrappedValue.dismiss()
                        },
                        label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 1, height: 1)
                                .foregroundColor(.white)
                                .background(Color.white)
                        })
                }
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            }
            
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct Home_V_Previews: PreviewProvider {
    static var previews: some View {
        Home_V()
    }
}

