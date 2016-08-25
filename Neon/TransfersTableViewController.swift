//
//  TransfersTableViewController.swift
//  Neon
//
//  Created by Lucas Domene Firmo on 8/24/16.
//  Copyright © 2016 Domene. All rights reserved.
//

import UIKit
import SCLAlertView

class TransfersTableViewController: BaseTableViewController {

    // MARK: - Attributes

    var transfers = [Transfer]()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTransfers()
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = TRANSFERS_TITLE
    }
    
    // MARK: - Data Fetchers
    
    func fetchTransfers() {
        startLoading()
        TransfersRequest().makeRequest(appDelegate.token!, completion: { transfers, error in
            if error != nil {
                SCLAlertView().showRetryAlert(TRANSFERS_ERROR, retryMethod: {
                    self.fetchTransfers()
                })
            } else {
                self.transfers = transfers!
                self.transfers = self.transfers.reverse()
                self.tableView.reloadData()
            }
            self.stopLoading()
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
        let cell = tableView.dequeueReusableCellWithIdentifier(CONTACT_CELL, forIndexPath: indexPath) as? ContactCell
        let transfer = transfers[indexPath.row]
        let contact = ContactDataManager.sharedInstance.getContactWithID(transfer.clientID)
        
        guard cell != nil else {
            return ContactCell()
        }
        
        guard contact != nil else {
            return cell!
        }
        
        cell?.fill(contact!)
        cell?.transferDateLabel.hidden = false
        cell?.transferDateLabel.text = transfer.date.formattedDate()
        
        return cell!
    }
    
    // MARK: - Table View Delegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let transfer = transfers[indexPath.row]
        if let contact = ContactDataManager.sharedInstance.getContactWithID(transfer.clientID) {
            SCLAlertView().showTransferDetails(transfer, contact: contact)
        } else {
            SCLAlertView().showError(WARNING, subTitle: UNKNOWN_ERROR)
        }
    }
}
