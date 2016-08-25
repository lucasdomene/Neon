//
//  Constants.swift
//  Neon
//
//  Created by Lucas Domene Firmo on 8/24/16.
//  Copyright © 2016 Domene. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Requests
let BASE_URL = "http://processoseletivoneon.azurewebsites.net"
let TOKEN_PATH = "/GenerateToken"
let SEND_MONEY_PATH = "/SendMoney"
let GET_TRANSFERS_PATH = "/GetTransfers"

// MARK: - Typealias
public typealias JSONDictionary = [String : AnyObject]

// MARK: - Custom Colors
let CUSTOM_GREEN_COLOR = UIColor(red: 8.0/255.0, green: 237.0/255.0, blue: 153.0/255.0, alpha: 1)