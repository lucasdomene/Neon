//
//  Contact.swift
//  Neon
//
//  Created by Lucas Domene Firmo on 8/24/16.
//  Copyright © 2016 Domene. All rights reserved.
//

import Foundation

class Contact {
    
    // MARK: - Attributes
    
    var id: Int
    var firstName: String
    var surname: String
    var phone: String
    var photo: String?
    
    // MARK: - Initializer
    
    init(id: Int, firstName: String, surname: String, phone: String, photo: String = "") {
        self.id = id
        self.firstName = firstName
        self.surname = surname
        self.phone = phone
        self.photo = photo
    }
}
