//
//  ViewController.swift
//  MapKit
//
//  Created by Suleyman Calik on 01/04/15.
//  Copyright (c) 2015 BAU. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var btnMyLocation: UIButton!
    
    var locationManager = CLLocationManager()
    var autoZoomed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareMapView()
    }

    
    @IBAction func goToMyLocation(sender: UIButton) {
        
        goToCoordinate(mapView.userLocation.coordinate)
    }
    
    
    func prepareMapView() {
        locationManager.delegate = self
        mapView.delegate = self
        
        //Karaköy
        var coord1 = CLLocationCoordinate2D(latitude:41.025120, longitude:28.977525)
        var ann1 = BAUAnnotation(coordinate:coord1)
        ann1.title = "Bahçeşehir Üni."
        ann1.subtitle = "Galata Kampüsü"
        mapView.addAnnotation(ann1)
        
        // Beşiktaş
        var coord2 = CLLocationCoordinate2D(latitude:41.042057, longitude:29.009072)
        var ann2 = BAUAnnotation(coordinate:coord2)
        ann2.title = "Bahçeşehir Üni."
        ann2.subtitle = "Beşiktaş Kampüsü"
        mapView.addAnnotation(ann2)
        
        
    }
    
    
    
    func goToCoordinate(coordinate:CLLocationCoordinate2D) {
        var coordinate = coordinate
        var region = MKCoordinateRegionMakeWithDistance(coordinate,2000,4000)
        mapView.setRegion(region, animated:true)
    }
    
}


extension ViewController:CLLocationManagerDelegate, MKMapViewDelegate {
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println(error)
    }
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        switch status {
        case .NotDetermined:
            // henüz izin istenmemiş, izin istenecek
            println("NotDetermined")
            locationManager.requestWhenInUseAuthorization()
            break
        case .Restricted, .Denied:
            // lokasyon alma iznimiz yok, kullanıcıyı bilgilendir
            println("Denied")
            break
        case .AuthorizedAlways , .AuthorizedWhenInUse:
            // lokasyon alma iznimiz var, lokasyon al :)
            println("Authorized")
            mapView.showsUserLocation = true
            break
        }
    }
    
    
    
    func mapView(mapView: MKMapView!, didUpdateUserLocation userLocation: MKUserLocation!) {
        if let location = userLocation?.location {
            if !autoZoomed {
                btnMyLocation.enabled = true
                autoZoomed = true
                goToCoordinate(location.coordinate)
            }
        }
    }
    
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        
        if annotation is BAUAnnotation {
            let identifier = "BauAnnotation"
            var annView =  MKAnnotationView(annotation:annotation, reuseIdentifier:identifier)
            
            annView.canShowCallout = true
            annView.image = UIImage(named:"bau")
            
            return annView
        }
        else {
            return nil
        }
        
    }
    
}







