//
//  MapViewController.swift
//  Yelp
//
//  Created by Hun Tun Zaw on 5/10/17.
//  Copyright © 2017 Timothy Lee. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    
    
    @IBOutlet weak var mapView: MKMapView!
    
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //set initial location to SJSU
        let initialLocation = CLLocation(latitude: 37.3352, longitude: -121.8811)
        centerMapOnLocation(location: initialLocation)
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
