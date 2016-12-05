//
//  ViewController.swift
//  Maps
//
//  Created by Yawo Echitey on 12/5/16.
//  Copyright © 2016 Echitey. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let lat: CLLocationDegrees = -5.8271441
        let long: CLLocationDegrees = -35.2205344
        
        let latDelta: CLLocationDegrees = 0.05
        let lonDelta: CLLocationDegrees = 0.05
        
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        
        let coord = CLLocationCoordinate2D(latitude: lat, longitude: long)
        
        let region = MKCoordinateRegion(center: coord, span: span)
        
        map.setRegion(region, animated: true)
        
        let listener = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longpress(gestureRecognizer:)))
        
        map.addGestureRecognizer(listener)
        
    }
    
    func longpress(gestureRecognizer: UIGestureRecognizer){
        let point = gestureRecognizer.location(in: self.map)
        
        let coord = map.convert(point, toCoordinateFrom: self.map)
        
        let annotation = MKPointAnnotation()
        annotation.title = "\(coord.latitude)  \(coord.longitude)"
        annotation.subtitle = "Here you clicked!"
        annotation.coordinate = coord
        map.addAnnotation(annotation)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

