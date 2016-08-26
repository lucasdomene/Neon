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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var connectingLabel: UILabel!
    
    // MARK: - Attributes
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    var shadowView = UIView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureImageView()
        configureShadowView()
        generateToken()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
    }
    override func viewDidLayoutSubviews() {
        drawCircle()
    }
    
    // MARK: - Instance Methods
    
    func configureImageView() {
        userImageView.layer.cornerRadius = userImageView.frame.size.width / 2
        userImageView.layer.borderColor = CUSTOM_BLUE_COLOR.CGColor
        userImageView.layer.borderWidth = 3
        userImageView.layer.masksToBounds = true
    }
    
    func configureShadowView() {
        shadowView = UIView(frame: view.frame)
        shadowView.backgroundColor = UIColor.blackColor()
        shadowView.alpha = 0.5
    }
    
    // MARK: - Data Fetchers
    
    func generateToken() {
        self.disableButtons()
        startLoading()
        GenerateTokenRequest().makeRequest(userNameLabel.text!, emaill: userEmailLabel.text!) { token, error in
            if error != nil {
                self.enableButtons()
                self.stopLoading()
                SCLAlertView().showRetryAlert(error! == Errors.NoConnection ? INTERNET_ERROR : CONNECTION_ERROR, retryMethod: {
                    self.generateToken()
                })
            } else {
                self.appDelegate.token = token
                self.enableButtons()
                self.stopLoading()
                SCLAlertView().showConnectedAlert()
            }
        }
    }
    
    // MARK: - Activity Indicator
    
    func startLoading() {
        view.addSubview(shadowView)
        view.bringSubviewToFront(activityIndicator)
        view.bringSubviewToFront(connectingLabel)
        
        activityIndicator.startAnimating()
        connectingLabel.hidden = false
    }
    
    func stopLoading() {
        shadowView.removeFromSuperview()
        activityIndicator.stopAnimating()
        connectingLabel.hidden = true
    }
    
    // MARK: - Buttons 
    
    func enableButtons() {
        self.transfersHistoryButton.enabled = true
        self.sendMoneyButton.enabled = true
    }
    
    func disableButtons() {
        self.transfersHistoryButton.enabled = false
        self.sendMoneyButton.enabled = false
    }
    
    func drawCircle() {
        let circlePath = UIBezierPath(ovalInRect: CGRectMake(userImageView.center.x - userImageView.bounds.size.width * 1.15, userImageView.center.y - userImageView.bounds.size.height * 1.15, userImageView.bounds.size.width * 2.3, userImageView.bounds.size.height * 2.3))
        circlePath.moveToPoint(CGPoint(x: userImageView.center.x, y: userImageView.center.y * 2.35))
        circlePath.addLineToPoint(CGPoint(x: userImageView.center.x, y: userImageView.center.y * 2.35 - 90))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.CGPath
        shapeLayer.fillColor = UIColor.clearColor().CGColor
        shapeLayer.strokeColor = UIColor.whiteColor().CGColor
        shapeLayer.lineWidth = 1.0
        
        view.layer.addSublayer(shapeLayer)
    }
}

