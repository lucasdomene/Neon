//
//  Transfer+Ext.swift
//  Neon
//
//  Created by Lucas Domene Firmo on 8/24/16.
//  Copyright © 2016 Domene. All rights reserved.
//

import Foundation

extension Transfer {
    
    convenience init(json: JSONDictionary) throws {
        guard let id = json[ID_KEY] as? Int,
            clientID = json[CLIENT_ID_KEY] as? Int,
            amount = json[AMOUNT_KEY] as? Double,
            token = json[TOKEN_KEY] as? String,
            date = json[DATE_KEY] as? String else {
                throw Errors.JSONMappingKeyNotFound
        }
        
        self.init(id: id, clientID: clientID, amount: amount, token: token, date: date)
    }
    
    class func massCreation(jsonArray: [JSONDictionary]) -> ([Transfer]?, Errors?) {
        var transfers = [Transfer]()
        for jsonDict in jsonArray {
            var transfer: Transfer? = nil
            do {
                transfer = try Transfer(json: jsonDict)
            } catch Errors.JSONMappingKeyNotFound {
                return (nil, Errors.JSONMappingKeyNotFound)
            } catch {
                return (nil, Errors.ObjectCreationError)
            }
            transfers.append(transfer!)
        }
        
        return (transfers, nil)
    }
    
}