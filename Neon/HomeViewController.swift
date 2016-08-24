//
//  HomeViewController.swift
//  Neon
//
//  Created by Lucas Domene Firmo on 8/24/16.
//  Copyright © 2016 Domene. All rights reserved.
//

import UIKit
import SCLAlertView

class HomeViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var sendMoneyButton: UIButton!
    @IBOutlet weak var transfersHistoryButton: UIButton!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureImageView()
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
    
    // MARK: - IBActions
    
    @IBAction func sendMoneyPressed(sender: UIButton) {
        
    }
    
    @IBAction func transfersHistoryPressed(sender: UIButton) {
        let appearance = SCLAlertView.SCLAppearance(
            showCloseButton: false
        )
        let alertView = SCLAlertView(appearance: appearance)
        let textField = alertView.addTextField("R$ 0,00")
        textField.keyboardType = .DecimalPad
        textField.text = "R$ " + textField.text!
        
        alertView.addButton("ENVIAR", action: {})
        alertView.addButton("CANCELAR", action: {})
        alertView.showSuccess("Lucas Domene", subTitle: "(11)99528-1889")
    }
}

