//
//  ViewController.swift
//  LocationApp
//
//  Created by sumit kadyan on 2015-05-24.
//  Copyright (c) 2015 sumit kadyan. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController ,CLLocationManagerDelegate,MKMapViewDelegate{
//Links the button with the storyboard
    @IBOutlet weak var PUSH: UIButton!

    //Links the storyboard with Viewcontroller
    
    @IBOutlet weak var map: MKMapView!
 //Location Managet that provides the location
    var manager:CLLocationManager!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//Creating an instance of the location manager
        
        manager=CLLocationManager()
        manager.delegate=self
        manager.desiredAccuracy=kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
    }
//location manager provides the latitiude and longitutde and plotting them on the map.
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        var userLocation:CLLocation=locations[0] as! CLLocation
        var latitude=userLocation.coordinate.latitude
        
        var longitude=userLocation.coordinate.longitude
        
        var coordinate=CLLocationCoordinate2DMake(latitude,longitude)
        
        var latDelta:CLLocationDegrees=0.05
        var lonDelta:CLLocationDegrees=0.05
        
        var span:MKCoordinateSpan=MKCoordinateSpanMake(latDelta, lonDelta)
        
        var location:CLLocationCoordinate2D=CLLocationCoordinate2DMake(latitude, longitude)
        
        var region:MKCoordinateRegion=MKCoordinateRegionMake(coordinate, span)
    //setting the latitude and the longitude on the map.
        self.map.setRegion(region,animated:true)
        
      var annotation=MKPointAnnotation()
        annotation.coordinate=location
        annotation.title="hello Friend"
        map.addAnnotation(annotation)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

