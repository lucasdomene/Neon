//
//  GenerateTokenRequest.swift
//  Neon
//
//  Created by Lucas Domene Firmo on 8/24/16.
//  Copyright © 2016 Domene. All rights reserved.
//

import Foundation

class GenerateTokenRequest: BaseRequest {
    func makeRequest(name: String, emaill: String, completion: (String?, ErrorType?) -> ()) {
        super.makeRequest(.GET, path: TOKEN_PATH, parameters: ["nome": name, "email": emaill]) { response in
            if let token = response.result.value as? String {
                completion(token, nil)
            } else if response.result.error?.code == -1009 {
                completion(nil, InternetError.NoConnection)
            } else {
                completion(nil, InternalServerError.Unknown)
            }
        }
    }
}