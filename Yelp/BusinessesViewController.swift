

import UIKit

class BusinessesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
 
    var businesses: [Business]!
    var refresher: UIRefreshControl!
    @IBOutlet weak var SearchOption: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func Refreshment(_ sender: UIButton) {
        self.tableView.reloadData()

    }
   
    var button: UIButton = UIButton()
 
  
    
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
        
        /*refresher = UIRefreshControl()
        refresher.attributedTitle = NSAttributedString(string:"Pull to Refresh")
        refresher.addTarget(self, action: #selector(getter :businesses), for: UIControlEvents.valueChanged)
        tableView.addSubview(refresher)
        refresher.endRefreshing()
        self.tableView.reloadData()
        viewDidLoad()*/
    }
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if businesses != nil{
            //return businesses!.count
            return 3
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BusinessCell", for: indexPath) as! BusinessCell
        let yelpRan = Int(arc4random_uniform(19) + 1)
        cell.business = businesses[yelpRan]
        let currentName = cell.business.name!
        let currentAddress = cell.business.address!
        print (currentName)
        print (currentAddress)
        return cell;
    
    }
   
 
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
