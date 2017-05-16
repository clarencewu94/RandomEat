//
//  CategoryViewController.swift
//  Yelp
//
//  Created by Hun Tun Zaw on 5/14/17.
//  Copyright © 2017 Brandon Nguyen, Clarence Wu, Hun Tun Zaw. All rights reserved.
//

import UIKit

@objc protocol CategoryViewControllerDelegate {
    @objc optional func categoryViewController(categoryViewController: CategoryViewController, didUpdateFilters filters: [String:AnyObject])
}

class CategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SwitchCellDelegate {

    
    @IBOutlet weak var categoryTableView: UITableView!
    weak var delegate: CategoryViewControllerDelegate?
    
    var categories: [[String:String]]!
    var switchStates = [Int:Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categories = yelpCategories()
        
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func cancelCategory(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func searchCategory(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        var filters = [String: AnyObject]()
        
        var selectedCategories = [String]()
        for (row,isSelected) in switchStates {
            if isSelected {
                selectedCategories.append(categories[row]["code"]!)
            }
        }
        if selectedCategories.count > 0 {
            filters["categories"] = selectedCategories as AnyObject
        }
       
        delegate?.categoryViewController?(categoryViewController: self, didUpdateFilters: filters)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = categoryTableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        cell.CategoryLabel.text = categories[indexPath.row]["name"]
        cell.delegate = self
        cell.onOffSwitch.isOn = switchStates[indexPath.row] ?? false
        return cell;
    }
    
    func switchCell(switchCell: CategoryCell, didChangeValue value: Bool){
        let indexPath = categoryTableView.indexPath(for: switchCell)!
        switchStates[indexPath.row] = value
    }


    func yelpCategories() -> [[String:String]]{
        return [["name": "Afghan", "code": "afghani"],
            ["name": "New American:", "code": "newamerican"],
            ["name": "Traditional American:", "code": "tradamerican"],
            ["name": "Asian Fusion", "code": "asianfusion"],
            ["name": "Barbeque", "code": "bbq"],
            ["name": "African", "code": "african"],
            ["name": "Breakfast & Brunch", "code": "breakfast_brunch"],
            ["name": "Buffets", "code": "buffets"],
            ["name": "Burgers", "code": "burgers"],
            ["name": "Cafes", "code": "cafes"],
            ["name": "Chinese", "code": "chinese"],
            ["name": "Creperies", "code": "creperies"],
            ["name": "Diner", "code": "diner"],
            ["name": "Fast Food", "code": "hotdogs"],
            ["name": "Filipino", "code": "filipino"],
            ["name": "Food Court", "code": "food_court"],
            ["name": "French", "code": "french"],
            ["name": "German", "code": "german"],
            ["name": "Greek", "code": "greek"],
            ["name": "Halal", "code": "halal"],
            ["name": "Hawaiian", "code": "hawaiian"],
            ["name": "Indian", "code": "indian"],
            ["name": "Indonesian", "code": "indonesian"],
            ["name": "International", "code": "international"],
            ["name": "Italian", "code": "italian"],
            ["name": "Japanese", "code": "japanese"],
            ["name": "Japanese Ramen", "code": "ramen"],
            ["name": "Japanese Sushi", "code": "handrolls"],
            ["name": "Kebab", "code": "kebab"],
            ["name": "Korean", "code": "korean"],
            ["name": "Malaysian", "code": "malaysian"],
            ["name": "Mediterranean", "code": "mediterranean"],
            ["name": "Mexican", "code": "mexican"],
            ["name": "Middle Eastern", "code": "mideastern"],
            ["name": "Modern Australian", "code": "modern_australian"],
            ["name": "Mongolian", "code": "mongolian"],
            ["name": "Moroccan", "code": "moroccan"],
            ["name": "Night Food", "code": "nightfood"],
            ["name": "Noodles", "code": "noodles"],
            ["name": "Persian", "code": "persian"],
            ["name": "Pizza", "code": "pizza"],
            ["name": "Polish", "code": "polish"],
            ["name": "Portuguese", "code": "portuguese"],
            ["name": "Potatoes", "code": "potatoes"],
            ["name": "Poutineries", "code": "poutineries"],
            ["name": "Pub Food", "code": "pubfood"],
            ["name": "Rice", "code": "rice"],
            ["name": "Russian", "code": "russian"],
            ["name": "Salad", "code": "salad"],
            ["name": "Sandwiches", "code": "sandwiches"],
            ["name": "Seafood", "code": "seafood"],
            ["name": "Singaporean", "code": "singaporean"],
            ["name": "Soul Food", "code": "soulfood"],
            ["name": "Soup", "code": "soup"],
            ["name": "Southern", "code": "southern"],
            ["name": "Spanish", "code": "spanish"],
            ["name": "Steakhouses", "code": "steak"],
            ["name": "Sushi Bars", "code": "sushi"],
            ["name": "Swedish", "code": "swedish"],
            ["name": "Tapas Bars", "code": "tapas"],
            ["name": "Tapas/Small Plates", "code": "tapasmallplates"],
            ["name": "Thai", "code": "thai"],
            ["name": "Turkish", "code": "turkish"],
            ["name": "Vegan", "code": "vegan"],
            ["name": "Vegetarian", "code": "vegetarian"],
            ["name": "Vietnamese", "code": "vietnamese"],
            ["name": "Waffles", "code": "waffles"],
            ["name": "Wok", "code": "wok"],
            ["name": "Wraps", "code": "wraps"]]
    }

}
