//
//  Boarding_V.swift
//  Gyros47
//
//  Created by finplif on 8/15/22.
//

import SwiftUI
import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import iPhoneNumberField

struct Boarding_V: View {
    @EnvironmentObject var registrationViewModal: Registration_VM
    
    @State private var name = ""
    @State private var phone = ""
    @State private var email = ""
    @State private var password = ""
    @State private var spassword = ""
    
    @State private var isLoginMode = false
    @State var alertTitle : String = ""
    @State var showAlert : Bool = false
    
    @AppStorage("signed_in") var currentUserSignedIn = false
    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack(spacing: 16) {
                    Picker(selection: $isLoginMode, label: Text("Picker here")) {
                        Text("Login")
                            .tag(true)
                        Text("Create Account")
                            .tag(false)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Group {
                        if isLoginMode {
                            TextField("Email", text: $email)
                                .keyboardType(.emailAddress)
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                            SecureField("Password", text: $password)
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                        } else {
                            TextField("Name", text: $name)
                                .disableAutocorrection(true)
                            iPhoneNumberField("Phone number", text: $phone)
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                            TextField("Email", text: $email)
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                                .keyboardType(.emailAddress)
                            SecureField("Password", text: $password)
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                        }
                    }
                    .padding(12)
                    .background(Color.white)
                    .cornerRadius(10)
                    
                    Button {
                        handleAction()
                    } label: {
                        HStack {
                            Spacer()
                            Text(isLoginMode ? "Log In" : "Create Account")
                                .foregroundColor(.white)
                                .font(.headline)
                            Spacer()
                        }
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(10)
                    }
                }
                .padding()
                
            }
            .navigationTitle("Welcome to Gyros47!")
        }
    }
    
    private func signIn() {
        registrationViewModal.auth.signIn(withEmail: email,
                    password: password) { result, error in
            if let error = error {
                print("Failed to login user:", error)
                return
            }
            
            DispatchQueue.main.async {
                registrationViewModal.signedIn.toggle()
            }
        }
    }
    
    private func signUp() {
        registrationViewModal.auth.createUser(withEmail: email,
                        password: password) { result, error in
            if let error = error {
                print("Failed to create user:", error)
                return
            }
            DispatchQueue.main.async {
                registrationViewModal.signedIn.toggle()
            }
            self.storeUserInformation(email: email, name: name, phone: phone)
        }
    }
    
    func storeUserInformation(email: String, name: String, phone: String) {
        guard let uid = registrationViewModal.auth.currentUser?.uid else { return }
        let userData = ["uid": uid, "email": email, "name": name, "phone": phone]
        
        registrationViewModal.firestore.collection("Users").document(uid).setData(userData) { error in
            if let error = error {
                print(error)
                return
            }
            print("Success")
        }
    }
    
    private func handleAction() {
        if isLoginMode {
            signIn()
            currentUserSignedIn = true
        } else {
            guard !email.isEmpty, !password.isEmpty, !name.isEmpty, !phone.isEmpty else { return }
            signUp()
            currentUserSignedIn = true
        }
    }
}

struct Boarding_V_Previews: PreviewProvider {
    static var previews: some View {
        Boarding_V()
        .background(Color.white)
    }
}

