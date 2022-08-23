//
//  Registration_V.swift
//  Gyros47
//
//  Created by finplif on 8/16/22.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct Registration_V: View {
    @State var name = ""
    @State var phone = ""
    @State var email = ""
    @State var password = ""
    @State var alertTitle : String = ""
    @State var showAlert : Bool = false
    
    @State var onboardingState: Int = 0
    
    @AppStorage("name") var currentUserName: String?
    @AppStorage("phone") var currentUserPhone: String?
    @AppStorage("email") var currentUserEmail: String?
    @AppStorage("password") var currentUserPassword: String?
    
    @EnvironmentObject var registrationViewModal: Registration_VM
    
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
                case 3:
                    passwordSection
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
                .autocapitalization(.none)
                
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
            
            TextField("+1...", text: $phone)
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
            Text("What's your email?")
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
            
            Spacer()
            Spacer()
        }
    }
    private var passwordSection: some View {
        VStack{
            Spacer()
            Text("Set up a password")
                .font(.largeTitle)
                .fontWeight(.medium)
                .padding(.bottom, 25)
            
            TextField("Password", text: $password)
                .font(.headline)
                .frame(width: 300, height: 25)
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(10)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                
            Rectangle()
                .frame(width: 300, height: 1)
            
//            SecureField("Password", text: $password)
//                .font(.headline)
//                .frame(width: 300, height: 25)
//                .padding(.horizontal)
//                .background(Color.white)
//                .cornerRadius(10)
//
//            Rectangle()
//                .frame(width: 300, height: 1)
            
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
            guard phone.count == 12 else {
                showalert(title: "Your phone number should start with +1")
                return
            }
        case 3:
            guard password.count >= 7 else {
                showalert(title: "Your password must be longer than 7 characters")
                return
            }
        default:
            break
        }
        
        if (onboardingState == 3) {
            registrationViewModal.signUp(email: email, password: password)
            currentUserName = name
            currentUserPhone = phone
            currentUserEmail = email
            currentUserPassword = password
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
        Registration_V()
    }
}
