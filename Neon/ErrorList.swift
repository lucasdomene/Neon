//
//  ErrorList.swift
//  Neon
//
//  Created by Lucas Domene Firmo on 8/24/16.
//  Copyright © 2016 Domene. All rights reserved.
//

import Foundation

enum JSONMappingError: ErrorType {
    case KeyNotFound
}

enum ObjectCreationError: ErrorType {
    case Unknown
}

enum InternalServerError: ErrorType {
    case Unknown
}

enum InternetError: ErrorType {
    case NoConnection
}