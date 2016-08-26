//
//  StringTests.swift
//  Neon
//
//  Created by Lucas Domene Firmo on 8/25/16.
//  Copyright © 2016 Domene. All rights reserved.
//

import XCTest
@testable import Neon

class StringTests: XCTestCase {
    
    func testFormattedAmount() {
        let amount = "R$ 20"
        let expectedAmount = 20.0
        
        XCTAssertEqual(amount.formattedMoneyAmount(), expectedAmount)
    }
    
    func testFormattedDate() {
        let date = "2016-08-24T18:36:57.977"
        let expectedDate = "24 de Agosto de 2016 - às 18h36"
        
        XCTAssertEqual(date.formattedDate(), expectedDate)
    }
    
}
