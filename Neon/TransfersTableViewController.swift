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
        //let contact = contacts[indexPath.row]
        
        guard cell != nil else {
            return ContactCell()
        }
        
        //cell?.fill(contact)
        return cell!
    }
}
