//
//  PaymentConfig.swift
//  Gyros47
//
//  Created by finplif on 8/27/22.
//

import Foundation

class PaymentConfig {
    
    var paymentIntentClientSecret: String?
    static var shared: PaymentConfig = PaymentConfig()
    
    private init() {
        
    }
}
