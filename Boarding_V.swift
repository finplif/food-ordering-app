//
//  Boarding_V.swift
//  Gyros47
//
//  Created by finplif on 8/15/22.
//

import SwiftUI
import UIKit
import Firebase

struct Boarding_V: View {
    @State var email = ""
    @State var password = ""
    
    @State var alertTitle : String = ""
    @State var showAlert : Bool = false
    
    @AppStorage("name") var currentUserName: String?
    @AppStorage("phone") var currentUserPhone: String?
    @AppStorage("email") var currentUserEmail: String?
    @AppStorage("password") var currentUserPassword: String?
    
    @EnvironmentObject var registrationViewModal: Registration_VM
    
    var body: some View {

        NavigationView{
            VStack (spacing: 20){
            
                Text("Welcome to Gyros47!")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .padding(.bottom, 25)
                
                TextField("Email", text: $email)
                    .font(.headline)
                    .frame(width: 300, height: 25)
                    .padding(.horizontal)
                    .background(Color.white)
                    .cornerRadius(10)
                
                Rectangle()
                    .frame(width: 300, height: 1)

                TextField("Password", text: $password)
                    .font(.headline)
                    .frame(width: 300, height: 25)
                    .padding(.horizontal)
                    .background(Color.white)
                    .cornerRadius(10)
                
                Rectangle()
                    .frame(width: 300, height: 1)
                    .padding(.bottom, 50)
                
                Button(
                    action: {
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        registrationViewModal.signIn(email: email, password: password)},
                    label: {
                        Text("Login")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: 300)
                            .background(Color.red)
                            .cornerRadius(10)
                    })
                
                Spacer()
                
                Text("If you don't have an account")
                    .padding(.top, 50)
                NavigationLink(
                    destination: Registration_V(),
                    label: {
                        Text("Sign Up")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .cornerRadius(10)
                    })
            }
            .multilineTextAlignment(.leading)
            .padding(30)
        }
    }
}

struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        Boarding_V()
            .background(Color.white)
    }
}
