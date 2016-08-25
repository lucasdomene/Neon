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
        navigationItem.title = SEND_MONEY_TITLE
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
            SendMoneyRequest().makeRequest(contact.id, token: appDelegate.token ?? "", amount: formattedAmout) { isSuccess in
                if isSuccess {
                    SCLAlertView().showSuccess(SENT, subTitle: "Quantidade enviada: R$ \(formattedAmout)")
                } else {
                    SCLAlertView().showError(WARNING, subTitle: SEND_MONEY_ERROR)
                }
                self.stopLoading()
            }
        } else {
            SCLAlertView().showWarning(WARNING, subTitle: NO_VALUE_ERROR)
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
        let cell = tableView.dequeueReusableCellWithIdentifier(CONTACT_CELL, forIndexPath: indexPath) as? ContactCell
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
        let contact = contacts[indexPath.row]
        SCLAlertView().showTransferAlert(contact) { amount in
            self.sendMoney(contact, amount: amount)
        }
    }
    
}
