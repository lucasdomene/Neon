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
    @IBOutlet weak var transferDateLabel: UILabel!
    
    // MARK: - Cell Configuration
    
    func configureContactImageView() {
        contactImageView.layer.cornerRadius = contactImageView.bounds.size.width / 2
        contactImageView.layer.borderWidth = 1.0
        contactImageView.layer.borderColor = UIColor.blackColor().CGColor
        contactImageView.layer.masksToBounds = true
    }
    
    func clean() {
        contactNameInitials.hidden = true
        contactImageView.image = nil
        contactNameLabel.text = ""
        contactPhoneLabel.text = ""
        transferDateLabel.text = ""
        transferDateLabel.hidden = true
    }
    
    // MARK: - Content Managment
    
    func fill(contact: Contact) {
        clean()
        configureContactImageView()
        contactNameLabel.text = contact.fullName()
        contactPhoneLabel.text = contact.phone
        
        if contact.photo == nil || contact.photo == "" {
            setNameInitialsToContactViewPhoto(contact)
        } else {
            contactImageView.image = UIImage(named: contact.photo!)
        }
    }
    
    func setNameInitialsToContactViewPhoto(contact: Contact) {
        if let initials = contact.nameInitials() {
            contactNameInitials.text = initials
            contactNameInitials.hidden = false
        } else {
            contactImageView.backgroundColor = UIColor.lightGrayColor()
        }
    }
}
