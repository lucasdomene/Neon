//
//  SendMoneyRequest.swift
//  Neon
//
//  Created by Lucas Domene Firmo on 8/24/16.
//  Copyright © 2016 Domene. All rights reserved.
//

import Foundation

class SendMoneyRequest: BaseRequest {
    /**
     Request a token to communicate to de API.
     - parameter contactID: the contact ID.
     - parameter token: the user token.
     - parameter amount: the money amount to be sent to the contact.
     - parameter completion: the completion method that receives a boolean indicating if the request was successful.
     */
    func makeRequest(contactID: Int, token: String, amount: Double, completion: (Bool) -> ()) {
        super.makeRequest(.POST, path: SEND_MONEY_PATH, parameters: [CLIENT_ID_PARAMETER: contactID, TOKEN_PARAMETER: token, AMOUNT_PARAMETER: amount]) { response in
            guard let isSuccess = response.result.value as? Bool else {
                completion(false)
                return
            }
            completion(isSuccess)
        }
    }
}