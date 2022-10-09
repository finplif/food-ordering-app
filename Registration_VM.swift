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
    
    @Published var user: Registration_M?
    @Published var signedIn: Bool = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    init() {
        DispatchQueue.main.async {
            self.signedIn = self.isSignedIn
        }
        
        fetchCurrentUser()
    }
    
    func fetchCurrentUser() {
        guard let uid = self.auth.currentUser?.uid else {
            print("fetching problems oops")
            return
            
        }
        
        firestore.collection("Users").document(uid).getDocument { snapshot, error in
            if let error = error {
                print("Failed to fetch current user:", error)
                return
            }
            
            guard let data = snapshot?.data() else {
                return
                
            }
            
            self.user = .init(data: data)
        }
    }
    
    func signOut() {
        
        try? auth.signOut()
        self.signedIn = false
    }
    
}

