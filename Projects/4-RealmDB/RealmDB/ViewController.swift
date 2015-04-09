//
//  ViewController.swift
//  RealmDB
//
//  Created by Suleyman Calik on 08/04/15.
//  Copyright (c) 2015 BAU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
    }


    @IBAction func signUp(sender: UIButton) {
        
        if countElements(txtUsername.text) > 0 && countElements(txtPassword.text) > 0 {
            
            //txtUsername alanına girilmiş değer ile daha önce kaydolmuş User var mı diye kontrol ediyoruz
            if User.objectsWhere("username = '\(txtUsername.text)' ").count > 0 {
                // hata ver "Böyle bir kullanıcı zaten var"
                println("Böyle bir kullanıcı zaten var!")
            }
            else {
                // kullanıcıyı kaydet
                
                // Yeni User oluştur
                var newUser = User()
                newUser.username = txtUsername.text
                newUser.password = txtPassword.text
                
                
                // realm dosyasına yazmaya başlıyoruz
                RLMRealm.defaultRealm().beginWriteTransaction()
                
                User.createInDefaultRealmWithObject(newUser)
                
                // realm dosyasına yazma işlemini bitiriyoruz
                RLMRealm.defaultRealm().commitWriteTransaction()
                
                // Giriş yapıldı, detay sayfasına git
                performSegueWithIdentifier("loggedin", sender:nil)
            }
        }
        else {
            println("Lütfen kullanıcı adı ve şifre giriniz!")
            // Hata mesajı göster
        }
        
        
    }

    @IBAction func login(sender: UIButton) {
        
        let query = "username = '\(txtUsername.text)' AND password = '\(txtPassword.text)' "
        if let user = User.objectsWhere(query).firstObject() as? User {
            // Kullanıcı adı ve şifre doğru
            
            // giriş yap
            performSegueWithIdentifier("loggedin", sender:nil)
        }
        else {
            println("Kullanıcı adınızı ve şifrenizi kontrol ediniz!")
        }
    }
    

}











