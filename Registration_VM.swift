//
//  Registration_VM.swift
//  Gyros47
//
//  Created by finplif on 8/22/22.
//

import Foundation
import Firebase
import FirebaseAuth

class Registration_VM: ObservableObject {
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email,
                    password: password) { [weak self] result, error in
            guard result != nil, error != nil else {
                return
            }
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email,
                        password: password) {result, error in
            guard result != nil, error != nil else {
                return
            }
            DispatchQueue.main.async {
                self.signedIn = true
            }
        }
    }
    
    func signOut() {
        try? auth.signOut()
        
        self.signedIn = false
    }
}
