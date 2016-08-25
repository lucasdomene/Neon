//
//  ContactsTableViewController.swift
//  Neon
//
//  Created by Lucas Domene Firmo on 8/24/16.
//  Copyright © 2016 Domene. All rights reserved.
//

import UIKit
import SCLAlertView

class ContactsTableViewController: UITableViewController {
    
    // MARK: - Attributes
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    var contacts = [Contact]()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        retrieveContacts()
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func registerCell() {
        let nib = UINib(nibName: "ContactCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "ContactCell")
    }
    
    // MARK: - Alert View
    
    func showTransferAlert(contact: Contact) {
        let appearance = SCLAlertView.SCLAppearance(showCloseButton: false)
        let alertView = SCLAlertView(appearance: appearance)
        let textField = alertView.addTextField("R$ 0,00")
        
        textField.keyboardType = .DecimalPad
        textField.text = "R$ " + textField.text!
        
        alertView.addButton("ENVIAR", action: {
            self.sendMoney(contact, amount: textField.text ?? "0")
        })
        alertView.addButton("CANCELAR", action: {})
        
        
        alertView.showSuccess(contact.fullName(), subTitle: contact.phone)
    }
    
    // MARK: - Data Fetchers
    
    func retrieveContacts() {
        let firstContact = Contact(id: "0", firstName: "Lucas", surname: "Domene", phone: "(11)99528-1889")
        let secondContact = Contact(id: "1", firstName: "Luís", surname: "Boça", phone: "(11)9956-2834", photo: "luisboca.png")
        contacts.appendContentsOf([firstContact, secondContact, firstContact, firstContact])
    }
    
    // MARK: - Send Money
    
    func sendMoney(contact: Contact, amount: String) {
        SendMoneyRequest().makeRequest(contact.id, token: appDelegate.token!, amount: amount.formatedMoneyAmount()) { isSuccess in
            if isSuccess {
                // TREAT SUCCESS
            } else {
                // TREAT FAILURE
            }
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
