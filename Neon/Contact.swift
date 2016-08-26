//
//  Contact.swift
//  Neon
//
//  Created by Lucas Domene Firmo on 8/24/16.
//  Copyright © 2016 Domene. All rights reserved.
//

import Foundation
import UIKit

class Contact {
    
    // MARK: - Attributes
    
    var id: Int
    var firstName: String
    var surname: String
    var phone: String
    var photo: String?
    
    // MARK: - Initializer
    
    init(id: Int, firstName: String, surname: String, phone: String, photo: String? = nil) {
        self.id = id
        self.firstName = firstName
        self.surname = surname
        self.phone = phone
        self.photo = photo
    }
    
    // MARK: - Helper Methods
    
    
    /**
     Create the full name of the contact.
     - returns: a String with the full contact name.
     */
    func fullName() -> String {
        return firstName + " " + surname
    }
    
    /**
     Create the image of the contact.
     - returns: a image of the contact. If the contact has no photo it will create a image from the contact's name initial letters.
     */
    func photoImage() -> UIImage {
        if photo == nil || photo == "" {
            return imageWithNameInitials()
        }
        return UIImage(named: photo!) ?? UIImage()
    }
    
    /**
     Create the contact's name initial letters.
     - returns: a string with the initial letters.
     */
    func nameInitials() -> String? {
        if let firstLetter = firstName.characters.first, lastLetter = surname.characters.first {
            return "\(firstLetter)\(lastLetter)".uppercaseString
        }
        return nil
    }
    
    /**
     Create a image with the initial letters.
     - returns: a image with the initial letters.
     */
    func imageWithNameInitials() -> UIImage {
        let label = UILabel(frame: CGRectMake(0, 0, 70, 70))
        label.textAlignment = .Center
        label.font = UIFont(name: "Avenir-Heavy", size: 40)
        label.textColor = UIColor.whiteColor()
        label.text = nameInitials()
        UIGraphicsBeginImageContext(label.bounds.size)
        label.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
}
