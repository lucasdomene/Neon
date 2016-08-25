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
let CUSTOM_BLUE_COLOR = UIColor(red: 0, green: 140.0/255.0, blue: 213.0/255.0, alpha: 1)

// MARK: - Cells

let CONTACT_CELL = "ContactCell"

// MARK: - Error Messages

let UNKNOWN_ERROR = "Ocorreu um erro! Tente novamente."
let WARNING = "Ops!"
let TRANSFERS_ERROR = "Não foi possível recuperar as transferências. Tentar novamente?"
let NO_VALUE_ERROR = "Não é possível enviar R$ 0,00!"
let SEND_MONEY_ERROR = "Ocorreu um erro no envio! Tente novamente."
let SENT = "Enviado!"
let SEND = "ENVIAR"
let CONNECTED = "Conectado!"
let CANCEL = "CANCELAR"
let CONNECTION_ERROR = "Não foi possível se conectar. Tentar novamente?"
let INTERNET_ERROR = "Verifique sua conexão com a internet. Tentar novamente?"

// MARK: - Navigation Titles

let TRANSFERS_TITLE = "HISTÓRICO DE ENVIOS"
let SEND_MONEY_TITLE = "ENVIAR DINHEIRO"

// MARK: - Parameters

let CLIENT_ID_PARAMETER = "ClienteId"
let TOKEN_PARAMETER = "token"
let AMOUNT_PARAMETER = "valor"
let NAME_PARAMETER = "nome"
let EMAIL_PARAMETER = "email"

// MARK: - JSON Keys

let ID_KEY = "Id"
let CLIENT_ID_KEY = "ClienteId"
let AMOUNT_KEY = "Valor"
let TOKEN_KEY = "Token"
let DATE_KEY = "Data"
