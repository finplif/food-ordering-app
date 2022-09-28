//
//  Registration_V.swift
//  Gyros47
//
//  Created by finplif on 8/16/22.
//

import SwiftUI
import Firebase
import FirebaseAuth
import iPhoneNumberField

struct Registration_V: View {
    
    @ObservedObject var registrationViewModal: Registration_VM
    let didCompleteLoginProcess: () -> ()
    @State var name = ""
    @State var phone = ""
    @State var email = ""
    @State var password = ""
    @State private var spassword = ""
    @State var loginStatusMessage = ""
    @State var alertTitle : String = ""
    @State var showAlert : Bool = false
    @State var LogOutOptions = false
    @State var onboardingState: Int = 0
    
    var body: some View {
        ZStack {
            ZStack {
                switch onboardingState{
                case 0:
                    nameSection
                case 1:
                    phoneSection
                case 2:
                    emailSection
                default:
                    Home_V()
                }
            }
            VStack{
                Spacer()
                bottomButton
            }
            .padding(30)
        }
        .alert(isPresented: $showAlert, content: {
            return Alert(title: Text(alertTitle))
        })
    }
}

extension Registration_V {
    private var bottomButton: some View {
        Button(
            action: {nextButtonPressed()},
            label: {
                Text(onboardingState == 3 ? "Sign Up" : "Next")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .cornerRadius(10)
            })
    }
    private var nameSection: some View {
        VStack{
            Spacer()
            Text("What's your name?")
                .font(.largeTitle)
                .fontWeight(.medium)
                .padding(.bottom, 25)
            
            TextField("Name", text: $name)
                .font(.headline)
                .frame(width: 300, height: 25)
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(10)
                .disableAutocorrection(true)
                
            Rectangle()
                .frame(width: 300, height: 1)
            
            Spacer()
            Spacer()
        }
    }
    private var phoneSection: some View {
        VStack{
            Spacer()
            Text("What's your phone number?")
                .font(.largeTitle)
                .fontWeight(.medium)
                .padding(.bottom, 25)
            
            iPhoneNumberField("Phone number", text: $phone)
                .font(.headline)
                .frame(width: 300, height: 25)
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(10)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                
            Rectangle()
                .frame(width: 300, height: 1)
            
            Spacer()
            Spacer()
        }
    }
    private var emailSection: some View {
        VStack{
            Spacer()
            Text("Create your email and password?")
                .font(.largeTitle)
                .fontWeight(.medium)
                .padding(.bottom, 25)
            
            TextField("Email", text: $email)
                .font(.headline)
                .frame(width: 300, height: 25)
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(10)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                
            Rectangle()
                .frame(width: 300, height: 1)
            
            SecureField("Password", text: $password)
                .font(.headline)
                .frame(width: 300, height: 25)
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(10)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                
            Rectangle()
                .frame(width: 300, height: 1)
            
            SecureField("Password", text: $spassword)
                .font(.headline)
                .frame(width: 300, height: 25)
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(10)
                .autocapitalization(.none)
                .disableAutocorrection(true)

            Rectangle()
                .frame(width: 300, height: 1)
            
            Spacer()
            Spacer()
        }
    }
    
    func nextButtonPressed() {
        
        switch onboardingState {
        case 0:
            guard name.count >= 2 else {
                showalert(title: "Yor name must be at least 2 characters long")
                return
            }
        case 1:
            guard phone.count >= 10 else {
                showalert(title: "Your phone number is missing some digits")
                return
            }
        case 2:
            guard password == spassword || password.count >= 7 else {
                showalert(title: "Your passwords either don't match or must be longer than 7 characters")
                return
            }

        default:
            break
        }
        
        if (onboardingState == 2) {
            registrationViewModal.signUp(email: email, password: password, name: name, phone: phone)
            registrationViewModal.storeUserInformation()
        } else {
            withAnimation(.spring()) {
                onboardingState += 1
            }
        }
    }
    
    func showalert(title: String) {
        alertTitle = title
        showAlert.toggle()
    }
}

struct Registration_V_Previews: PreviewProvider {
    static var previews: some View {
        Registration_V(registrationViewModal: Registration_VM(), didCompleteLoginProcess: {})
    }
}

