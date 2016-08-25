//
//  ErrorList.swift
//  Neon
//
//  Created by Lucas Domene Firmo on 8/24/16.
//  Copyright © 2016 Domene. All rights reserved.
//

import Foundation

enum Errors: ErrorType {
    case JSONMappingKeyNotFound
    case ObjectCreationError
    case InternalServerError
    case NoConnection
}