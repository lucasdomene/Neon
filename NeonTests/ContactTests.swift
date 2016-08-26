//
//  ContactTests.swift
//  Neon
//
//  Created by Lucas Domene Firmo on 8/25/16.
//  Copyright © 2016 Domene. All rights reserved.
//

import XCTest
@testable import Neon

class ContactTests: XCTestCase {
    
    func testContactCreationWithPhoto() {
        let id = 0
        let firstName = "Lucas"
        let surname = "Domene"
        let phone = "(11)99528-1889"
        let photo = "me.png"
        
        let contact = contactWithPhoto()
            
        XCTAssertEqual(id, contact.id)
        XCTAssertEqual(firstName, contact.firstName)
        XCTAssertEqual(surname, contact.surname)
        XCTAssertEqual(phone, contact.phone)
        XCTAssertEqual(photo, contact.photo)
    }
    
    func testContactCreationWithoutPhoto() {
        let id = 0
        let firstName = "Lucas"
        let surname = "Domene"
        let phone = "(11)99528-1889"
        
        let contact = contactWithoutPhoto()
        
        XCTAssertEqual(id, contact.id)
        XCTAssertEqual(firstName, contact.firstName)
        XCTAssertEqual(surname, contact.surname)
        XCTAssertEqual(phone, contact.phone)
    }
    
    func testFullName() {
        let fullName = "Lucas Domene"
        let contact = contactWithPhoto()
        
        XCTAssertEqual(fullName, contact.fullName())
    }
    
    func testNameInitials() {
        let nameInitials = "LD"
        let contact = contactWithPhoto()
        
        XCTAssertEqual(nameInitials, contact.nameInitials())
    }
    
    func contactWithPhoto() -> Contact {
        return Contact(id: 0, firstName: "Lucas", surname: "Domene", phone: "(11)99528-1889", photo: "me.png")
    }
    
    func contactWithoutPhoto() -> Contact {
        return Contact(id: 0, firstName: "Lucas", surname: "Domene", phone: "(11)99528-1889")
    }
    
    
}
