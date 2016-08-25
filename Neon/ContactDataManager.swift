//
//  ContactDataManager.swift
//  Neon
//
//  Created by Lucas Domene Firmo on 8/24/16.
//  Copyright © 2016 Domene. All rights reserved.
//

import Foundation

class ContactDataManager {
    
    // MARK: - Attributes
    
    private var contacts: [Contact]?
    
    // Singleton instance
    static let sharedInstance = ContactDataManager()
    
    // MARK: - Data Fetchers
    
    func getContacts() -> [Contact] {
        if contacts != nil {
            return contacts!
        }
        
        contacts = [Contact]()
        if let contactsArray = retrieveContactsFromPlist() {
            createContactsFromArray(contactsArray)
        }

        return contacts!
    }
    
    func getContactWithID(id: String) -> Contact? {
        for contact in getContacts() {
            if contact.id == id {
                return contact
            }
        }
        return nil
    }
    
    func retrieveContactsFromPlist() -> NSArray? {
        let contactsArray: NSArray?
        if let path = NSBundle.mainBundle().pathForResource("Contacts", ofType: "plist") {
            contactsArray = NSArray(contentsOfFile: path)
            return contactsArray!
        } else {
            // TREAT ERROR
            return nil
        }
    }
    
    func createContactsFromArray(contactsArray: NSArray) {
        for contactDictionary in contactsArray {
            let contact = Contact(id: contactDictionary.objectForKey("id") as! String,
                                  firstName: contactDictionary.objectForKey("firstName") as! String,
                                  surname: contactDictionary.objectForKey("surname") as! String,
                                  phone: contactDictionary.objectForKey("phone") as! String,
                                  photo: contactDictionary.objectForKey("photo") as? String)
            contacts!.append(contact)
        }
    }
}