//
//  Transfer.swift
//  Neon
//
//  Created by Lucas Domene Firmo on 8/24/16.
//  Copyright © 2016 Domene. All rights reserved.
//

import Foundation

class Transfer {
    
    // MARK: - Attributes
    
    var id: Int
    var clientID: Int
    var amount: Double
    var token: String
    var date: String
    
    // MARK: - Initializer
    
    init(id: Int, clientID: Int, amount: Double, token: String, date: String) {
        self.id = id
        self.clientID = clientID
        self.amount = amount
        self.token = token
        self.date = date
    }

}