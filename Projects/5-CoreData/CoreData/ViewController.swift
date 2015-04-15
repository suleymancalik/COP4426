//
//  ViewController.swift
//  CoreData
//
//  Created by Suleyman Calik on 15/04/15.
//  Copyright (c) 2015 BAU. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    var appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
    

    @IBAction func loginTapped(sender:UIButton) {
    }

    @IBAction func signUpTapped(sender:UIButton) {
        
        if countElements(txtUsername.text) > 0 &&
            countElements(txtPassword.text) > 0 {
                
                var fetchRequest = NSFetchRequest(entityName: "User")
                fetchRequest.predicate = NSPredicate(format:"username == '\(txtUsername.text)' ")
                
                
                // bu username ile bir kullanıcı var mı?
                if let users = appDelegate.managedObjectContext?.executeFetchRequest(fetchRequest,error:nil) as? [User] {
                    if users.count > 0 {
                        // varsa hata ver
                        println("Bu username ile kayıtlı kullanıcı zaten var!")
                    }
                    else {
                        println("User bulunamadı")
                        // yoksa kaydet
                    }
                }
                else {
                    println("Hata oluştu!")
                }
        }
        else {
            println("Alanlar Boş Bırakılamaz!")
        }
        
    }


}











