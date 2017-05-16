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
<<<<<<< HEAD

=======
        
>>>>>>> 528b07ce488c679c8839b60aeb862f3f9c3efaef
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        self.map.setRegion(region, animated: true)
        
<<<<<<< HEAD

=======
        
>>>>>>> 528b07ce488c679c8839b60aeb862f3f9c3efaef
        print(location.altitude)
        print(location.speed)
        map.showsUserLocation = true
        manager.stopUpdatingLocation();
<<<<<<< HEAD

=======
        
>>>>>>> 528b07ce488c679c8839b60aeb862f3f9c3efaef
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        /*let location = locations[0]
         let LocationCorrdinate = CLLocationCoordinate2D(LocationCoordinate.coordinate.latitude, LocationCoordinate.coordinate.longitude)
         let annotation = MKPointAnnotation()
         annotation.coordinate = location
         annotation.title = "Store"
         annotation.subtitle = "Location Of Store"
         
         map.addAnnotation(annotation)*/
    }
    
}




