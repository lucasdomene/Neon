//
//  GenerateTokenRequest.swift
//  Neon
//
//  Created by Lucas Domene Firmo on 8/24/16.
//  Copyright © 2016 Domene. All rights reserved.
//

import Foundation

class GenerateTokenRequest: BaseRequest {
    /**
     Request a token to communicate to de API.
     - parameter name: the user name.
     - parameter email: the user email.
     - parameter completion: the completion method that receives a token or an error.
     */
    func makeRequest(name: String, emaill: String, completion: (String?, Errors?) -> ()) {
        super.makeRequest(.GET, path: TOKEN_PATH, parameters: [NAME_PARAMETER: name, EMAIL_PARAMETER: emaill]) { response in
            if let token = response.result.value as? String {
                completion(token, nil)
            } else if response.result.error?.code == -1009 {
                completion(nil, Errors.NoConnection)
            } else {
                completion(nil, Errors.InternalServerError)
            }
        }
    }
}