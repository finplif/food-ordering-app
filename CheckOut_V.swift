//
//  CheckOut_V.swift
//  Gyros47
//
//  Created by finplif on 8/15/22.
//

import SwiftUI
import Stripe

struct CheckOut_V: View {
    @State private var message: String = ""
    @State private var isSuccess: Bool = false
    @State private var paymentMethodParams: STPPaymentMethodParams?
    let paymentGatewayController = PaymentGatewayController()
    
    @EnvironmentObject var cart: Cart_VM
    @EnvironmentObject var dataManager: DataManager
    
    @AppStorage("name") var currentUserName: String?
    
    private func pay() {
        
        guard let clientSecret = PaymentConfig.shared.paymentIntentClientSecret else {
            return
        }
        
        let paymentIntentParams = STPPaymentIntentParams(clientSecret: clientSecret)
        paymentIntentParams.paymentMethodParams = paymentMethodParams
        
        paymentGatewayController.submitPayment(intent: paymentIntentParams) { status, intent, error in
            
            switch status {
                case .failed:
                    message = "Failed"
                case .canceled:
                    message = "Cancelled"
                case .succeeded:
                    message = "Your payment has been successfully completed!"
            }
            
        }
        cart.items = []
    }
    
    var body: some View {
        VStack {
            List {
                ForEach(cart.items) { item in
                    HStack {
                        Text("\(String(item.quantity)) x")
                        Text(item.title)
                        Spacer()
                        Text(numberformatter(value: item.price) ?? "")
                    }
                }
                
                HStack {
                    Text("Total:")
                    Spacer()
                    Text((numberformatter(value: cart.cartTotal) ?? ""))
                }
                
                Section {
                    // Stripe Credit Card TextField Here
                    STPPaymentCardTextField.Representable.init(paymentMethodParams: $paymentMethodParams)
                } header: {
                    Text("Payment Information")
                }
                
                HStack {
                    Button(
                        action: {
                            pay()
                        },
                        label: {
                            Text("Complete payment")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(height: 55)
                                .frame(maxWidth: 350)
                                .background(Color.red)
                                .cornerRadius(10)
                        })
                    .buttonStyle(.plain)
                    Spacer()
                }
                Text(message)
                    .font(.headline)
            }
            NavigationLink(
                isActive: $isSuccess,
                destination: {Confirmation_V()},
                label: {EmptyView()})
            .navigationTitle("Checkout")
        }
    }
    
    func numberformatter(value: Double) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: value))
    }
}

struct CheckOut_V_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CheckOut_V()
        }
        .environmentObject(Cart_VM())
        .environmentObject(DataManager())
    }
}

