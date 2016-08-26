//
//  TransferTests.swift
//  Neon
//
//  Created by Lucas Domene Firmo on 8/25/16.
//  Copyright © 2016 Domene. All rights reserved.
//

import XCTest
@testable import Neon

class TransferTests: XCTestCase {
    
    let transferMock = "{\"ClienteId\": 0,\"Data\": \"2016-08-24T18:36:57.977\",\"Id\": 0,\"Token\": \"9b267714-9b58-4fbc-8aac-635d98af4a7e\",\"Valor\": 50}"
    
    func testTransferCreation() {
        let id = 0
        let clientID = 10
        let amount = 100.0
        let token = "aass-dasdasda-dasdas-das"
        let date = "123434545645"
        
        let transfer = Transfer(id: id, clientID: clientID, amount: amount, token: token, date: date)
        
        XCTAssertEqual(id, transfer.id)
        XCTAssertEqual(clientID, transfer.clientID)
        XCTAssertEqual(amount, transfer.amount)
        XCTAssertEqual(token, transfer.token)
        XCTAssertEqual(date, transfer.date)
    }
    
    func testTransferCreationWithMock() {
        let data = transferMock.dataUsingEncoding(NSUTF8StringEncoding)
        let json = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
        let transfer = try! Transfer(json: json as! JSONDictionary)
        
        XCTAssertEqual(0, transfer.id)
        XCTAssertEqual(0, transfer.clientID)
        XCTAssertEqual(50, transfer.amount)
        XCTAssertEqual("9b267714-9b58-4fbc-8aac-635d98af4a7e", transfer.token)
        XCTAssertEqual("2016-08-24T18:36:57.977", transfer.date)
    }
    
}
