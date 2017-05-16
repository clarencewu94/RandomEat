//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Brandon Nguyen on 4/23/17.
//  Copyright (c) 2017 Brandon Nguyen, Clarence Wu, Hun Tun Zaw. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CategoryViewControllerDelegate {
    
    var businesses: [Business]!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func RefreshButton(_ sender: UIButton) {
        self.tableView.reloadData()
    }
    
    var button: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: BusinessCell)
        self.tableView.backgroundColor = UIColor.clear

        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.delegate = self
        Business.searchWithTerm(term: "Restaurants", completion: { (businesses: [Business]?, error: Error?) -> Void in
            
            self.businesses = businesses
            self.tableView.reloadData()
            if let businesses = businesses {
                for business in businesses {
                    print(business.name!)
                    print(business.address!)
                }
            }
            
            }
        )
    }
     func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
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
        let currentName = cell.business.name!
        let currentAddress = cell.business.address!
        print (currentName)
        print (currentAddress)
        return cell;
    }
     func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.destination is MapViewController{
            let NextSegue = segue.destination as! MapViewController
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "BusinessCell", for: indexPath) as! BusinessCell
                //let yelpRan = Int(arc4random_uniform(20) + 0)
                let yelpRan = Int(arc4random_uniform(UInt32(businesses.count)))
                cell.business = businesses[yelpRan]
                let currentName = cell.business.name!
                let currentAddress = cell.business.address!
                print (currentName)
                print (currentAddress)
                return cell;
            }

    }
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
