//
//  Gyros47App.swift
//  Gyros47
//
//  Created by finplif on 8/14/22.
//

import SwiftUI
import FirebaseCore
import Firebase
import UIKit
import Stripe
import FirebaseFirestore
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions:
                     [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct Gyros47App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var cartViewModal: Cart_VM = Cart_VM()
    @StateObject var ingredientsViewModal: Ingredients_VM = Ingredients_VM()
    @StateObject var dataManager = DataManager()
    @StateObject var registrationViewModal = Registration_VM()

    init() {
        StripeAPI.defaultPublishableKey = "pk_test_51LV2MLBhPLEaNYnoYps3G2OSmngOInxYrz5PUaLlhGezInLwPEodbvbzcHuAYW4UYrVl7LkYG2wBhw5l1kG3fn2Z00NIRCkRdC"
    }

  var body: some Scene {
      WindowGroup {
          VStack{
              Intro_V()
          }
          .environmentObject(Cart_VM())
          .environmentObject(Ingredients_VM())
          .environmentObject(DataManager())
          .environmentObject(Registration_VM())
      }
    }
}
