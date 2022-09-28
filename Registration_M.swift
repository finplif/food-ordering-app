//
//  User.swift
//  Gyros47
//
//  Created by finplif on 9/19/22.
//

import Foundation

struct Registration_M: Codable {
    var uid: String
    var name: String
    var phone: String
    var email: String
    
    init(data: [String: Any]) {
        self.uid = data["uid"] as? String ?? ""
        self.name = data["name"] as? String ?? ""
        self.phone = data["phone"] as? String ?? ""
        self.email = data["email"] as? String ?? ""
    }
}
