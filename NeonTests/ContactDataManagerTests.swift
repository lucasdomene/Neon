//
//  ContactDataManagerTests.swift
//  Neon
//
//  Created by Lucas Domene Firmo on 8/25/16.
//  Copyright © 2016 Domene. All rights reserved.
//

import XCTest
@testable import Neon

class ContactDataManagerTests: XCTestCase {
    
    func testGetContacts() {
        XCTAssertTrue(!ContactDataManager.sharedInstance.getContacts().isEmpty)
    }
    
    func testGetContactWithID() {
        XCTAssertNotNil(ContactDataManager.sharedInstance.getContactWithID(0))
    }
    
    func testRetrieveContactsFromPlist() {
        XCTAssertNotNil(ContactDataManager.sharedInstance.retrieveContactsFromPlist())
    }
}
