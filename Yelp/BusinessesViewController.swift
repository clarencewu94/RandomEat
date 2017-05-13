

import UIKit

class BusinessesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var businesses: [Business]!
    var refresher: UIRefreshControl!
    @IBOutlet weak var SearchOption: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: BusinessCell)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        Business.searchWithTerm(term: "Thai", completion: { (businesses: [Business]?, error: Error?) -> Void in
            
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
        
        refresher = UIRefreshControl()
        refresher.attributedTitle = NSAttributedString(string:"Pull to Refresh")
        refresher.addTarget(self, action: #selector(BusinessesViewController.populate), for: UIControlEvents.valueChanged)
        tableView.addSubview(refresher)
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
        let yelpRan = Int(arc4random_uniform(19) + 1)
        cell.business = businesses[yelpRan]
        return cell;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
