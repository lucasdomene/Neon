//
//  ContactCell.swift
//  Neon
//
//  Created by Lucas Domene Firmo on 8/24/16.
//  Copyright © 2016 Domene. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var contactPhoneLabel: UILabel!
    @IBOutlet weak var contactNameInitials: UILabel!
    
    // MARK: - Cell Configuration
    
    func configureContactImageView() {
        contactImageView.layer.cornerRadius = contactImageView.bounds.size.width / 2
        contactImageView.layer.masksToBounds = true
    }
    
    // MARK: - Content Managment
    
    func fill(contact: Contact) {
        configureContactImageView()
        contactNameLabel.text = contact.fullName()
        contactPhoneLabel.text = contact.phone
        setNameInitialsToContactViewPhoto(contact)
    }
    
    func setNameInitialsToContactViewPhoto(contact: Contact) {
        if let firstLetter = contact.firstName.characters.first, lastLetter = contact.surname.characters.first {
            let nameInitials = "\(firstLetter)\(lastLetter)".uppercaseString
            contactNameInitials.text = nameInitials
            contactNameInitials.hidden = false
        } else {
            // TREAT NO PHOTO AND ERROR GETTING INITIALS
        }
    }
}
