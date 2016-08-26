//
//  SCLAlertView+Ext.swift
//  Neon
//
//  Created by Lucas Domene Firmo on 8/25/16.
//  Copyright © 2016 Domene. All rights reserved.
//

import Foundation
import SCLAlertView

extension SCLAlertView {
    
    // MARK: - Alerts
    
    /**
     Show a retry alert.
     - parameter message: the alert message.
     - parameter retryMethod: a completion to be used to call the method to run again.
     */
    func showRetryAlert(message: String, retryMethod: () -> ()) {
        let appearance = SCLAlertView.SCLAppearance(showCloseButton: false)
        let retryAlert = SCLAlertView(appearance: appearance)
        retryAlert.addButton("SIM", action: { retryMethod() })
        retryAlert.addButton(CANCEL, action: {})
        retryAlert.showError(WARNING, subTitle: message)
    }
    
    /**
     Show a succes alert to inform the user that the connection was established.
     */
    func showConnectedAlert() {
        let appearance = SCLAlertView.SCLAppearance(showCloseButton: false)
        let alertView = SCLAlertView(appearance: appearance)
        alertView.showSuccess(CONNECTED, subTitle: "", duration: 1)
    }
    
    /**
     Show a money transfer alert.
     - parameter contact: the contact that will be send the transfer.
     - parameter sendMoneyAction: the completion to be used to call the send money action.
     */
    func showTransferAlert(contact: Contact, sendMoneyAction: (String) -> ()) {
        let appearance = SCLAlertView.SCLAppearance(showCloseButton: false, kCircleIconHeight: 50)
        let alertView = SCLAlertView(appearance: appearance)
        
        let textField = alertView.addTextField("R$ 0,00")
        textField.keyboardType = .DecimalPad
        textField.text = "R$ " + textField.text!
        
        alertView.addButton(SEND, action: { sendMoneyAction(textField.text ?? "0") })
        alertView.addButton(CANCEL, action: {})
        
        alertView.showInfo(contact.fullName(), subTitle: contact.phone, circleIconImage: contact.photoImage())
    }
    
    /**
     Show a transfer detail alert.
     - parameter transfer: the transfer to be shown.
     - parameter contact: the contact to which the transfer was made.
     */
    func showTransferDetails(transfer: Transfer, contact: Contact) {
        let appearance = SCLAlertView.SCLAppearance(showCloseButton: false, kCircleIconHeight: 50)
        let alertView = SCLAlertView(appearance: appearance)
        
        alertView.addButton("OK", action: {})
        let detailsString = "\(contact.phone)\n\nValor transferido: R$ \(transfer.amount)"
        alertView.showInfo(contact.fullName(), subTitle: detailsString, circleIconImage: contact.photoImage())
    }
}