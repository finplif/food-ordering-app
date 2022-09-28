//
//  Registration_VM.swift
//  Gyros47
//
//  Created by finplif on 8/22/22.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

class Registration_VM: ObservableObject {
    
    let auth = Auth.auth()
    let firestore = Firestore.firestore()
    
    @Published var errorMessage = ""
    
    @Published var user: Registration_M?
    @Published var reg: Registration_V?
    @Published var signedIn: Bool = false
    
    var uuid: String? {
        auth.currentUser?.uid
    }
    
    var userIsAuthenticated: Bool {
        return auth.currentUser != nil
    }
    
    var userIsAuthenticatedAndSynced: Bool {
        return user != nil && userIsAuthenticated
    }
    
    init() {
        DispatchQueue.main.async {
            self.signedIn = self.auth.currentUser?.uid == nil
        }
        fetchCurrentUser()
    }
    
    func fetchCurrentUser() {
        guard let uid = auth.currentUser?.uid else {
            self.errorMessage = "Could not find firebase uid"
            return
        }
        
        self.firestore.collection("Users").document(uid).getDocument { snapshot, error in
            if let error = error {
                self.errorMessage = "Failed to fetch current user: \(error)"
                print("Failed to fetch current user:", error)
                return
            }
            
            guard let data = snapshot?.data() else {
                self.errorMessage = "No data found"
                return
            }
                    
            self.user = .init(data: data)
        }
    }
    
    func signIn(email: String, password: String) {
        self.auth.signIn(withEmail: email,
                    password: password) { result, error in
            if let error = error {
                print("Failed to login user:", error)
                self.reg?.loginStatusMessage = "Failed to login user: \(error)"
                return
            }
            
            self.reg?.loginStatusMessage = "Successfully logged in as user: \(result?.user.uid ?? "")"
            
            self.reg?.didCompleteLoginProcess()
            DispatchQueue.main.async {
                self.fetchCurrentUser()
                self.signedIn = true
            }
        }
    }
    
    func signUp(email: String, password: String, name: String, phone: String) {
        self.auth.createUser(withEmail: email,
                        password: password) { result, error in
            if let error = error {
                print("Failed to create user:", error)
                self.reg?.loginStatusMessage = "Failed to create user: \(error)"
                return
            }
            
            self.reg?.loginStatusMessage = "Successfully created user: \(result?.user.uid ?? "")"
            DispatchQueue.main.async {
                self.fetchCurrentUser()
                self.signedIn = true
            }
        }
    }
    
    func signOut() {
        signedIn.toggle()
        try? self.auth.signOut()
    }
    
    func storeUserInformation() {
        guard let uid = self.auth.currentUser?.uid else { return }
        let userData = ["uid": uid, "email": reg?.email, "name": reg?.name, "phone": reg?.phone]
        
        self.firestore.collection("Users").document(uid).setData(userData) { error in
            if let error = error {
                print(error)
                self.reg?.loginStatusMessage = "\(error)"
                return
            }
            print("Success")
            
            self.reg?.didCompleteLoginProcess()
        }
    }
}
