//
//  TransfersTableViewController.swift
//  Neon
//
//  Created by Lucas Domene Firmo on 8/24/16.
//  Copyright © 2016 Domene. All rights reserved.
//

import UIKit

class TransfersTableViewController: UITableViewController {

    // MARK: - Attributes
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    var transfers = [Transfer]()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        fetchTransfers()
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = "HISTÓRICO DE ENVIOS"
    }
    
    func registerCell() {
        let nib = UINib(nibName: "ContactCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "ContactCell")
    }
    
    // MARK: - Data Fetchers
    
    func fetchTransfers() {
        TransfersRequest().makeRequest(appDelegate.token!, completion: { transfers, error in
            if error != nil {
                // TREAT ERROR
            } else {
                self.transfers = transfers!
                self.tableView.reloadData()
            }
        })
    }
    
    // MARK: - Table View Data Source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transfers.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ContactCell", forIndexPath: indexPath) as? ContactCell
        let transfer = transfers[indexPath.row]
        let contact = ContactDataManager.sharedInstance.getContactWithID(String(transfer.clientID))
        
        guard cell != nil else {
            return ContactCell()
        }
        
        guard contact != nil else {
            print("Couldnt retrieve customer")
            return cell!
        }
        
        cell?.fill(contact!)
        cell?.transferDateLabel.hidden = false
        cell?.transferDateLabel.text = transfer.date
        
        return cell!
    }
    
    // MARK: - Table View Delegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
            
    }
}
