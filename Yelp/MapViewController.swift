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

class BusinesssAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var business: Business!
    var title: String?
    var index: Int!
    
    init(title: String, coordinate: CLLocationCoordinate2D, business: Business, index: Int) {
        self.coordinate = coordinate
        self.business = business
        self.index = index
        self.title = title
    }
    
}
class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    //Making the Map go directly to the Resturant location
    @IBOutlet weak var map: MKMapView!
    
    let manager = CLLocationManager()
    var business: Business!
    
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
        manager.stopUpdatingLocation();

    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        }

        
        /*let location = locations[0]
         let LocationCorrdinate = CLLocationCoordinate2D(LocationCoordinate.coordinate.latitude, LocationCoordinate.coordinate.longitude)
         let annotation = MKPointAnnotation()
         annotation.coordinate = location
         annotation.title = "Store"
         annotation.subtitle = "Location Of Store"
         
         map.addAnnotation(annotation)*/
    
    
}




