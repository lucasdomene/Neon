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
    
    /**
     Get all contacts.
     returns: a array of contacts.
     */
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
    
    /**
     Get a contact given an ID.
     - parameter id: the contact ID.
     - returns: a contact if it exists.
     */
    func getContactWithID(id: Int) -> Contact? {
        for contact in getContacts() {
            if contact.id == id {
                return contact
            }
        }
        return nil
    }
    
    /**
     Retrieve the contacts from the plist.
     - returns: a array with all contacts dictionaries.
     */
    func retrieveContactsFromPlist() -> NSArray? {
        let contactsArray: NSArray?
        if let path = NSBundle.mainBundle().pathForResource("Contacts", ofType: "plist") {
            contactsArray = NSArray(contentsOfFile: path)
            return contactsArray!
        } else {
            return nil
        }
    }
    
    /**
     Create contacts objects from dictionaries from the plist.
     - parameter contactsArray: the array with all contacts dictionaries.
     */
    func createContactsFromArray(contactsArray: NSArray) {
        for contactDictionary in contactsArray {
            let contact = Contact(id: Int(contactDictionary.objectForKey("id") as! String)!,
                                  firstName: contactDictionary.objectForKey("firstName") as! String,
                                  surname: contactDictionary.objectForKey("surname") as! String,
                                  phone: contactDictionary.objectForKey("phone") as! String,
                                  photo: contactDictionary.objectForKey("photo") as? String)
            contacts!.append(contact)
        }
    }
}