//
//  Intro_V.swift
//  Gyros47
//
//  Created by finplif on 8/15/22.
//

import SwiftUI

struct Intro_V: View {
    @EnvironmentObject var registrationViewModal: Registration_VM
    
    var body: some View {
        ZStack {
            if registrationViewModal.signedIn || registrationViewModal.userIsAuthenticatedAndSynced {
                    Home_V()
                        .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
            } else {
                Boarding_V()
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .bottom)))
            }
        }
//        .onAppear{
//            registrationViewModal.signedIn = registrationViewModal.isSignedIn
//        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        Intro_V()
            .background(Color.white)
    }
}
