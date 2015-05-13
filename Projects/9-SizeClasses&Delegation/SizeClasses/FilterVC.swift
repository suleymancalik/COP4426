//
//  FilterVC.swift
//  SizeClasses
//
//  Created by Suleyman Calik on 13/05/15.
//  Copyright (c) 2015 BAU. All rights reserved.
//

import UIKit

enum Konu:Int,Printable {
    case ÜslüSayılar
    case KöklüSayılar
    
    var description: String {
        switch self {
        case .ÜslüSayılar:
            return "Üslü Sayılar"
        case .KöklüSayılar:
            return "Köklü Sayılar"
        }
    }
}


protocol FilterDelegate {
    func filterSelected(topic:Konu)
}


class FilterVC: UIViewController {

    var delegate:FilterDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func topicSelected(sender: UIButton) {
        
        dismissViewControllerAnimated(true, completion:{ () -> Void in
            if let konu = Konu(rawValue:sender.tag) {
                self.delegate?.filterSelected(konu)
            }
        })
    }
    
    

}



















