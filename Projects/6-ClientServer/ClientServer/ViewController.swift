//
//  ViewController.swift
//  ClientServer
//
//  Created by Suleyman Calik on 22/04/15.
//  Copyright (c) 2015 BAU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblTemprature: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var currentWeather:Weather!
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        getWeather()
    }
    
    func updateUI() {
        // currentWeather'a göre UI'ı güncelleyecek
        lblTemprature.text = "\(currentWeather.temprature) ℃"
        lblDescription.text = currentWeather.weatherDescription
    }
    
    @IBAction func refreshWeather(sender: UIButton) {
        getWeather()
    }


    
    func getWeather() {
        spinner.startAnimating()
        let urlString = "http://api.openweathermap.org/data/2.5/weather?q=Istanbul&units=metric&lang=tr"
        if let url = NSURL(string:urlString) {
            
            var request = NSURLRequest(URL:url)
            
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response:NSURLResponse!, data:NSData!, error:NSError!) -> Void in
                /////////
                /// asenkron çağrı sonucunun döndüğü block

                if let data = data {
                    
                    if let str = NSString(data:data, encoding:NSUTF8StringEncoding) {
                        println(str)
                    }
                    
                    
                    var errorPointer:NSError?
                    var jsonObject:AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.AllowFragments, error:&errorPointer)
                    if let weatherDataDict = jsonObject as? NSDictionary {
                        
                        
                        var temprature:Double!
                        var description:String!
                        
                        if let mainDict = weatherDataDict["main"] as? NSDictionary {
                            if let temp = mainDict["temp"] as? NSNumber {
                                temprature = temp.doubleValue
                            }
                        }
                        
                        if let weatherArray = weatherDataDict["weather"] as? [NSDictionary] {
                            if let weatherDict = weatherArray.first {
                                if let desc = weatherDict["description"] as? String {
                                    description = desc
                                }
                            }
                        }
                        
                        self.currentWeather = Weather(temprature:temprature, description:description)
                        self.updateUI()
                    }
                    else {
                        println("JSON Data parse edilemedi: \(errorPointer)")
                    }
                }
                else {
                    println("Data gelmedi: \(error)")
                }
                
                self.spinner.stopAnimating()

                /////////
            })
            
        }
        else {
            println("URL oluşturulamadı")
        }
    }


}










