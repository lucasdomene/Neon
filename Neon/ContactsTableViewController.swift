//
//  ContactsTableViewController.swift
//  Neon
//
//  Created by Lucas Domene Firmo on 8/24/16.
//  Copyright © 2016 Domene. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {
    
    // MARK: - Attributes
    
    var contacts = [Contact]()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        retrieveContacts()
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: - Data Fetchers
    
    func retrieveContacts() {
        let firstContact = Contact(id: 0, firstName: "Lucas", surname: "Domene", phone: "(11)99528-1889")
        contacts.appendContentsOf([firstContact, firstContact, firstContact, firstContact])
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
        let contact = self.contacts[indexPath.row]
        
        guard cell != nil else {
            return ContactCell()
        }
        
        cell?.fill(contact)
        return cell!
    }
}
