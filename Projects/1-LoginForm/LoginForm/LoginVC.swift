//
//  LoginVC.swift
//  LoginForm
//
//  Created by Suleyman Calik on 04/03/15.
//  Copyright (c) 2015 Bahcesehir. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func login(sender:UIButton) {
        
        if countElements(txtEmail.text) > 0 &&
            countElements(txtPassword.text) > 0 {
                performSegueWithIdentifier("ShowHomePage", sender:nil)
        }
        else {
            println("Email yada şifre girilmedi!")
        }
    }
    

}



















