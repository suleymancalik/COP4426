//
//  ViewController.swift
//  TableView
//
//  Created by Suleyman Calik on 18/03/15.
//  Copyright (c) 2015 BAU. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    var hoca = "Süleyman"
    
    var students = [
        ("Savaş"   , "1240044"),
        ("Aytin"   , "0848623"),
        ("Erman"   , "1175053") ,
        ("Onur"    , "1113886"),
        ("Yasemin" , "1033811")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        var tbl = UITableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //MARK: TableView Methods
    
    
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Hoca"
        }
        else {
            return "Öğrenciler"
        }
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        println("numberOfRowsInSection:\(section)")
        
        if section == 0 {
            return 1
        }
        else {
            return students.count
        }
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("StudentCell") as UITableViewCell
        
        var section = indexPath.section
        
        if section == 0 {
            cell.textLabel?.text = hoca
            cell.detailTextLabel?.text = ""
        }
        else {
            var index = indexPath.row
            var student = students[index]
            
            cell.textLabel?.text = student.0
            cell.detailTextLabel?.text = student.1
            println("cellForRowAtIndexPath section:\(indexPath.section) index:\(index) name:\(student.0)")
        }
        
        return cell
    }
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var title = indexPath.section == 0 ? "Hoca Seçildi" : "Öğrenci Seçildi"
        var message = indexPath.section == 0 ? hoca : students[indexPath.row].0
        
        var alertView = UIAlertView(title:title, message:message, delegate:nil, cancelButtonTitle:"Tamam")
        alertView.show()
        
        tableView.deselectRowAtIndexPath(indexPath, animated:true)
    }

}
















