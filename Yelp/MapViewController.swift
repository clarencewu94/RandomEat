//
//  MapViewController.swift
//  Yelp
//

import UIKit
import MapKit
import CoreLocation

//class MapViewController: UIViewController {
//
//    
//    
//    @IBOutlet weak var mapView: MKMapView!
//    
//    let regionRadius: CLLocationDistance = 1000
//    func centerMapOnLocation(location: CLLocation) {
//        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
//                                                                  regionRadius * 2.0, regionRadius * 2.0)
//        mapView.setRegion(coordinateRegion, animated: true)
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        
//        //set initial location to SJSU
//        let initialLocation = CLLocation(latitude: 37.3352, longitude: -121.8811)
//        centerMapOnLocation(location: initialLocation)
//        
//        
//        
//    }


class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    //Making the Map go directly to the Resturant location
    @IBOutlet weak var map: MKMapView!
    
    let manager = CLLocationManager()
    
    let regionRadius: CLLocationDistance = 1000
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            let location = locations[0]
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        self.map.setRegion(region, animated: true)
        
        print(location.altitude)
        print(location.speed)
        map.showsUserLocation = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    
    
   /* var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if (CLLocationManager.locationServicesEnabled())
        {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        let userLocation:CLLocation = locations[0] as! CLLocation
        let long = userLocation.coordinate.longitude;
        let lat = userLocation.coordinate.latitude;
        
        //let location = locations.last as! CLLocation
        
        //let center = CLLocationCoordinate2D(latitude: lat, longitude: long)
        
        let span = MKCoordinateSpanMake(0.5, 0.5)
        
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: lat, longitude: long), span: span)
        
        self.theMap.setRegion(region, animated: true)
        
    }*/
    
    
    
}




