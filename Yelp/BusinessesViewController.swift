//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Brandon Nguyen on 4/23/17.
//  Copyright (c) 2017 Brandon Nguyen, Clarence Wu, Hun Tun Zaw. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class BusinessesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate, CategoryViewControllerDelegate {
    

    
    @IBOutlet weak var tableView: UITableView!
    

    @IBOutlet weak var mapView: MKMapView!

    
    @IBAction func RefreshButton(_ sender: UIButton) {
        self.tableView.reloadData()
    }
    
    var button: UIButton = UIButton()
    
    
    var businesses: [Business]!
    var nameToBusiness  = [String : Business] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: BusinessCell)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.mapView.delegate = self

        
        Business.searchWithTerm(term: "Restaurants", completion: { (businesses: [Business]?, error: Error?) -> Void in
            
            self.reloadListAndMapViews()

            self.businesses = businesses
            self.tableView.reloadData()
            if let businesses = businesses {
                for business in businesses {
                    //print(business.name!)
                    //print(business.address!)
                }
            }
            
        }
        )
    }
    
    func reloadListAndMapViews() {
        
        // reload table view
        self.tableView.reloadData()
        
        // add annotations to map view
        var coordinate = CLLocationCoordinate2DMake(37.0,-122.0);
        var annotation = MKPointAnnotation()
        self.mapView.removeAnnotations(self.mapView.annotations);
        print("Before if statement")
        if let businesses = self.businesses {
            print ("if statement 1 works")
            for business in businesses {
                if let lat = business.lat,
                    let lon = business.lon {
                    coordinate = CLLocationCoordinate2DMake(lat, lon)
                    annotation = MKPointAnnotation()
                    annotation.coordinate = coordinate
                    annotation.title = business.name
                    annotation.subtitle = business.address
                    
                    print ("inside if statement")

                    // var placemark = MKPlacemark(coordinate: coordinate , addressDictionary: nil);
                    // placemark.title = business.name
                    self.nameToBusiness[annotation.title! + annotation.subtitle!] = business
                    self.mapView.addAnnotation(annotation)
                    
                }
            }
            
            self.mapView.selectAnnotation(annotation, animated: true);
            let  viewRegion =
                MKCoordinateRegionMakeWithDistance(coordinate, 2000, 2000);
            let adjustedRegion = self.mapView.regionThatFits(viewRegion)
            self.mapView.setRegion(adjustedRegion, animated: true)
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if businesses != nil{
            //return businesses!.count
            return 1
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BusinessCell", for: indexPath) as! BusinessCell
        //let yelpRan = Int(arc4random_uniform(20) + 0)
        let yelpRan = Int(arc4random_uniform(UInt32(businesses.count)))
        cell.business = businesses[yelpRan]
        let currentName = cell.business?.name!
        let currentAddress = cell.business?.address!
        //print (currentName)
        //print (currentAddress)
        return cell;
    }
    
    
    @IBAction func mapButtonClicked(_ sender: UIButton) {

            let transitionParams :  UIViewAnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
            UIView.transition(from: self.tableView,
                              to: self.mapView,
                              duration: 0.5,
                              options: transitionParams,
                              completion: nil);
//         else {
//            let transitionParams :  UIViewAnimationOptions = [.transitionFlipFromLeft, .showHideTransitionViews]
//            UIView.transition(from: self.mapView,
//                              to: self.tableView,
//                              duration: 0.5,
//                              options: transitionParams,
//                              completion: nil);
//        }
     //   sender.title = sender.title == "List" ? "Map" : "List"
    }
//    @IBAction func mapButtonBarClicked(_ sender: UIBarButtonItem) {
//        
//        if sender.title == "Map" {
//            let transitionParams :  UIViewAnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
//            UIView.transition(from: self.tableView,
//                              to: self.mapView,
//                              duration: 0.5,
//                              options: transitionParams,
//                              completion: nil);
//        } else {
//            let transitionParams :  UIViewAnimationOptions = [.transitionFlipFromLeft, .showHideTransitionViews]
//            UIView.transition(from: self.mapView,
//                              to: self.tableView,
//                              duration: 0.5,
//                              options: transitionParams,
//                              completion: nil);
//        }
//        sender.title = sender.title == "List" ? "Map" : "List"
//    }
//    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        let annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "loc")
//        
//        annotationView.canShowCallout = true
//        annotationView.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
//        
//        // annotationView.image = UIImage(named: "phone.png")
//        return annotationView
//    }
//
//    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
//        
//        self.performSegue(withIdentifier: "showDetailSegue", sender: view)
//    }
    
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.destination is UINavigationController {
            let navigationController = segue.destination as! UINavigationController
            if navigationController.viewControllers[0] is CategoryViewController{
                let categoryViewController = navigationController.topViewController as! CategoryViewController
                categoryViewController.delegate = self
            }
            //let categoryViewController = navigationController.topViewController as! CategoryViewController
          //  categoryViewController.delegate = self

        }
        //let navigationController = segue.destination as! UINavigationController
       // let categoryViewController = navigationController.topViewController as! CategoryViewController
        //categoryViewController.delegate = self
    }
    
    func categoryViewController(categoryViewController: CategoryViewController, didUpdateFilters filters: [String : AnyObject]) {
        
        let categories = filters["categories"] as? [String]
        
        Business.searchWithTerm(term: "Restaurants", sort: nil, categories: categories, deals: nil)
        { (businesses: [Business]!, error: Error!) -> Void in
                self.businesses = businesses
                self.tableView.reloadData()
        }
        //Business.searchWithTerm(term: "Restaurants", sort: nil, categories: categories, deals: nil, completion: ([Business]?, Error?) -> Void)
    }
    
    
}
