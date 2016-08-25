//
//  ContactsTableViewController.swift
//  Neon
//
//  Created by Lucas Domene Firmo on 8/24/16.
//  Copyright © 2016 Domene. All rights reserved.
//

import UIKit
import SCLAlertView

class ContactsTableViewController: BaseTableViewController {
    
    // MARK: - Attributes
    
    var contacts = [Contact]()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveContacts()
        tableView.reloadData()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "ENVIAR DINHEIRO"
    }
    
    // MARK: - Alert View
    
    func showTransferAlert(contact: Contact) {
        let appearance = SCLAlertView.SCLAppearance(showCloseButton: false, kCircleIconHeight: 50)
        let alertView = SCLAlertView(appearance: appearance)
        
        let textField = alertView.addTextField("R$ 0,00")
        textField.keyboardType = .DecimalPad
        textField.text = "R$ " + textField.text!
        
        alertView.addButton("ENVIAR", action: {
            self.sendMoney(contact, amount: textField.text ?? "0")
        })
        alertView.addButton("CANCELAR", action: {})
        
        alertView.showInfo(contact.fullName(), subTitle: contact.phone, circleIconImage: contact.photoImage())
    }
    
    // MARK: - Data Fetchers
    
    func retrieveContacts() {
        contacts = ContactDataManager.sharedInstance.getContacts()
    }
    
    // MARK: - Send Money
    
    func sendMoney(contact: Contact, amount: String) {
        let formattedAmout = amount.formattedMoneyAmount()
        if formattedAmout > 0 {
            startLoading()
            SendMoneyRequest().makeRequest(contact.id, token: appDelegate.token!, amount: formattedAmout) { isSuccess in
                if isSuccess {
                    SCLAlertView().showSuccess("Enviado!", subTitle: "Quantidade enviada: R$ \(formattedAmout)")
                } else {
                    SCLAlertView().showError("Ops!", subTitle: "Ocorreu um erro no envio! Tente novamente.")
                }
                self.stopLoading()
            }
        } else {
            SCLAlertView().showWarning("Ops!", subTitle: "Não é possível enviar R$ 0,00!")
        }
    }
    
    // MARK: - Table View Data Source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ContactCell", forIndexPath: indexPath) as? ContactCell
        let contact = contacts[indexPath.row]
        
        guard cell != nil else {
            return ContactCell()
        }
        
        cell?.fill(contact)
        return cell!
    }
    
    // MARK: - Table View Delegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        showTransferAlert(contacts[indexPath.row])
    }
    
}
