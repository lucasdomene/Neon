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
    
    func showRetryAlert(message: String, retryMethod: () -> ()) {
        let appearance = SCLAlertView.SCLAppearance(showCloseButton: false)
        let retryAlert = SCLAlertView(appearance: appearance)
        retryAlert.addButton("SIM", action: { retryMethod() })
        retryAlert.addButton(CANCEL, action: {})
        retryAlert.showError(WARNING, subTitle: message)
    }
    
    func showConnectedAlert() {
        let appearance = SCLAlertView.SCLAppearance(showCloseButton: false)
        let alertView = SCLAlertView(appearance: appearance)
        alertView.showSuccess(CONNECTED, subTitle: "", duration: 1)
    }
    
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
    
    func showTransferDetails(transfer: Transfer, contact: Contact) {
        let appearance = SCLAlertView.SCLAppearance(showCloseButton: false, kCircleIconHeight: 50)
        let alertView = SCLAlertView(appearance: appearance)
        
        alertView.addButton("OK", action: {})
        let detailsString = "\(contact.phone)\n\nValor transferido: R$ \(transfer.amount)"
        alertView.showInfo(contact.fullName(), subTitle: detailsString, circleIconImage: contact.photoImage())
    }
}