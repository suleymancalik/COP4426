//
//  ViewController.swift
//  SizeClasses
//
//  Created by Suleyman Calik on 13/05/15.
//  Copyright (c) 2015 BAU. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FilterDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        SVProgressHUD.show()
        
        
        3.delay { () -> Void in
            SVProgressHUD.dismiss()
        }
        
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let filterVC = segue.destinationViewController as? FilterVC {
            filterVC.delegate = self
        }
    }

    
    
    func filterSelected(topic: Konu) {
        println("Filtre seçildi! \(topic)")
        
        
    }


}



extension Double {

    func delay(handler:()-> Void) {
        myDispatch(self,handler)
    }
}



func myDispatch(delay:Double, block:()-> Void) {
    let delayTime = dispatch_time(DISPATCH_TIME_NOW,
        Int64(delay * Double(NSEC_PER_SEC)))
    
    dispatch_after(delayTime, dispatch_get_main_queue()) { () -> Void in
        block()
    }

}


