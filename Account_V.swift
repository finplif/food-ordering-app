//
//  Account_V.swift
//  Gyros47
//
//  Created by finplif on 8/15/22.
//

import SwiftUI

struct Account_V: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var registrationViewModal: Registration_VM
    
    var body: some View {
        NavigationView{
            ScrollView {
                Rectangle()
                .frame(height: 0.5)
                .padding(.top, 5)
                
                HStack{
                    Text(registrationViewModal.user?.name ?? "Your name here")
                        .font(.title3)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.horizontal, 10)
                .frame(height: 60)
                
                Rectangle()
                .frame(height: 0.5)
                
                HStack{
                    Text(registrationViewModal.user?.phone ?? "Your phone here")
                    .font(.title3)
                    .fontWeight(.bold)
                    Spacer()
                }
                .padding(.horizontal, 10)
                .frame(height: 60)
                
                Rectangle()
                .frame(height: 0.5)
                
                HStack{
                    Text(registrationViewModal.user?.email ?? "Your email here")
                        .font(.title3)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.horizontal, 10)
                .frame(height: 60)
                
                Rectangle()
                .frame(height: 0.5)
                
//                HStack{
//                    Text(currentUserPassword ?? "Your password here")
//                        .font(.title3)
//                        .fontWeight(.bold)
//                    Spacer()
//                }
//                .padding(.horizontal, 10)
//                .frame(height: 60)
//                
//                Rectangle()
//                .frame(height: 0.5)
                
                Text("Log Out")
                .foregroundColor(.white)
                .font(.headline)
                .frame(width: 300, height: 55)
                .background(Color.black)
                .cornerRadius(10)
                .padding(.top, 10)
                .onTapGesture {
                    registrationViewModal.signOut()
//                    currentUserSignedIn.toggle()
                }
            }
            .navigationTitle("Account Information")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct Account_Previews: PreviewProvider {
    static var previews: some View {
        Account_V(registrationViewModal: Registration_VM())
    }
}
