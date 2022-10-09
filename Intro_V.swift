//
//  Intro_V.swift
//  Gyros47
//
//  Created by finplif on 8/15/22.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

struct Intro_V: View {
    
    @AppStorage("signed_in") var currentUserSignedIn = false
    @EnvironmentObject var registrationViewModal: Registration_VM
    
    var body: some View {
        ZStack {
            if registrationViewModal.isSignedIn {
                    Home_V()
//                        .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
            } else {
                Boarding_V()
//                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .bottom)))
            }
        }
        .onAppear{
            registrationViewModal.signedIn = registrationViewModal.isSignedIn
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        Intro_V()
            .background(Color.white)
    }
}
