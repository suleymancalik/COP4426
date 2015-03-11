//
//  HomePageVC.swift
//  LoginForm
//
//  Created by Suleyman Calik on 11/03/15.
//  Copyright (c) 2015 Bahcesehir. All rights reserved.
//

import UIKit

class HomePageVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        UITableView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logout(sender: UIButton) {
        dismissViewControllerAnimated(true, completion:nil)
    }

    @IBAction func openLessonDetail(sender: UIButton) {
        performSegueWithIdentifier("LessonDetail", sender:nil)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}










