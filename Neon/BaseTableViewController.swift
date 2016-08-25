//
//  BaseTableViewController.swift
//  Neon
//
//  Created by Lucas Domene Firmo on 8/25/16.
//  Copyright © 2016 Domene. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {
    
     // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureActivityIndicator()
        registerCell()
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: - Attributes
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
    
    // MARK: - Instance Methods
    
    func configureActivityIndicator() {
        activityIndicator.backgroundColor = CUSTOM_GREEN_COLOR
        activityIndicator.center = CGPointMake(UIScreen.mainScreen().bounds.size.width / 2, UIScreen.mainScreen().bounds.size.height / 2)
        activityIndicator.layer.cornerRadius = 10
    }
    
    func registerCell() {
        let nib = UINib(nibName: "ContactCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "ContactCell")
    }
    
    // MARK: - Activity Indicator
    
    func startLoading() {
        activityIndicator.startAnimating()
        appDelegate.window?.addSubview(activityIndicator)
    }
    
    func stopLoading() {
        activityIndicator.removeFromSuperview()
    }
}
