//
//  LoginViewController.swift
//  Envit
//
//  Created by Likhit Garimella on 13/04/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
// import Firebase
import JGProgressHUD

class LoginViewController: UIViewController {
    
    // Outlets
    @IBOutlet var emailId: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var loginOutlet: UIButton!
    @IBOutlet var signupOutlet: UIButton!
    
    // Notifies the VC that its view was added to a view hierarchy
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        /*
        if Auth.auth().currentUser != nil {
            print("Current user: \(String(describing: Auth.auth().currentUser))")
            // segue to tab bar VC
            self.performSegue(withIdentifier: "goToHome", sender: self)
        }
        */
        
        // if user signed in
        if Api.UserDet.CURRENT_USER != nil {
            // print("Current user: \(Auth.auth().currentUser)")
            // segue to tab bar VC
            self.performSegue(withIdentifier: "goToHome", sender: self)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        
        BorderProp()
        CornerRadius()
        LeftPadding()
        ButtonProp()

    }
    
    func BorderProp() {
        
        // Textfield Border Property
        let myColor = UIColor.systemGray
        emailId.layer.borderColor = myColor.cgColor
        emailId.layer.borderWidth = 1.6
        password.layer.borderColor = myColor.cgColor
        password.layer.borderWidth = 1.6
        
    }
    
    func CornerRadius() {
        
        // Textfield Corner Radius Property
        emailId.layer.cornerRadius = 4
        password.layer.cornerRadius = 4
        
    }
    
    func LeftPadding() {
        
        // Create a padding view for Credits TextFields on LEFT
        emailId.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: emailId.frame.height))
        emailId.leftViewMode = .always
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: password.frame.height))
        password.leftViewMode = .always
        
    }
    
    func ButtonProp() {
        
        // Button Properties
        loginOutlet.layer.cornerRadius = 6
        signupOutlet.layer.cornerRadius = 6
        
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        
        // dismiss keyboard
        view.endEditing(true)
        
        // Progress HUD
        let hud1 = JGProgressHUD(style: .dark)
        // hud1.textLabel.text = "Please Wait..."
        hud1.show(in: self.view)
        
        // validations
        guard let email = emailId.text, let password = password.text else {
            print("Invalid Form Input")
            return
        }
        
        // Auth service sign in
        AuthService.signIn(email: email, password: password, onSuccess: {
            print("On Success")
            hud1.indicatorView = nil    // remove indicator
            hud1.textLabel.text = "Logged In!"
            hud1.dismiss(afterDelay: 2.0, animated: true)
            // segue to tab bar VC
            self.performSegue(withIdentifier: "goToHome", sender: self)
        }, onError: {errorString in
            // this will be the one which prints error due to auth, in console
            print(errorString!)
            hud1.indicatorView = nil    // remove indicator
            hud1.textLabel.text = errorString!
            hud1.dismiss(afterDelay: 2.0, animated: true)
        })
        
    }
    
    @IBAction func signupTapped(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToSignup", sender: self)
        
    }
    
}   // #132
