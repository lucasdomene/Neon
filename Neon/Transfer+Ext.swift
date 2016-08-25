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
        guard let id = json["Id"] as? Int,
            clientID = json["ClienteId"] as? Int,
            amount = json["Valor"] as? Double,
            token = json["Token"] as? String,
            date = json["Data"] as? String else {
                throw JSONMappingError.KeyNotFound
        }
        
        self.init(id: id, clientID: clientID, amount: amount, token: token, date: date)
    }
    
    class func massCreation(jsonArray: [JSONDictionary]) -> ([Transfer]?, ErrorType?) {
        var transfers = [Transfer]()
        for jsonDict in jsonArray {
            var transfer: Transfer? = nil
            do {
                transfer = try Transfer(json: jsonDict)
            } catch JSONMappingError.KeyNotFound {
                return (nil, JSONMappingError.KeyNotFound)
            } catch {
                return (nil, ObjectCreationError.Unknown)
            }
            transfers.append(transfer!)
        }
        
        return (transfers, nil)
    }
    
}