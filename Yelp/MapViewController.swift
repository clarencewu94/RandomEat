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
    @IBOutlet weak var theMap: MKMapView!
    let regionRadius: CLLocationDistance = 1000
    
    
    var locationManager: CLLocationManager!
    
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
        
    }
    
    
    
}




