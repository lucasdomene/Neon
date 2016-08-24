//
//  HomeViewController.swift
//  Neon
//
//  Created by Lucas Domene Firmo on 8/24/16.
//  Copyright © 2016 Domene. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var sendMoneyButton: UIButton!
    @IBOutlet weak var transfersHistoryButton: UIButton!
    
    // MARK: - Attributes
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureImageView()
        generateToken()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // MARK: - Instance Methods
    
    func configureImageView() {
        userImageView.layer.cornerRadius = userImageView.frame.size.width / 2
        userImageView.layer.masksToBounds = true
    }
    
    // MARK: - Data Fetchers
    
    func generateToken() {
        GenerateTokenRequest().makeRequest(userNameLabel.text!, emaill: userEmailLabel.text!) { (token, error) in
            if error != nil {
                // TREAT ERROR
                // RETRY AFTER ALERT
                //self.generateToken()
            } else {
                self.appDelegate.token = token
            }
        }
    }
}

