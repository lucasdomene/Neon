//
//  TransfersRequest.swift
//  Neon
//
//  Created by Lucas Domene Firmo on 8/24/16.
//  Copyright © 2016 Domene. All rights reserved.
//

import Foundation

class TransfersRequest: BaseRequest {
    /**
     Request a token to communicate to de API.
     - parameter token: the user token.
     - parameter completion: the completion method that receives a array of transfers or an error.
     */
    func makeRequest(token: String, completion: ([Transfer]?, Errors?) -> ()) {
        super.makeRequest(.GET, path: GET_TRANSFERS_PATH, parameters: ["token": token]) { response in
            if let transfersJSON = response.result.value as? [JSONDictionary] {
                let data = Transfer.massCreation(transfersJSON)
                return completion(data.0, data.1)
            } else if response.result.error?.code == -1009 {
                completion(nil, Errors.NoConnection)
            } else {
                completion(nil, Errors.InternalServerError)
            }
        }
    }
}