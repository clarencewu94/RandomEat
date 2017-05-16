//
//  ViewController.swift
//  Yelp
//
//  Created by Student on 5/15/17.
//  Copyright © 2017 Brandon Nguyen, Clarence Wu, Hun Tun Zaw. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    let history = ["Afghan", "African", "American", "Asian Fusion", "Australian",  "Chinese",  "Filipino", "French", "German", "Halal", "Hawaiian", "Indian", "Indonesian", "Italian", "Japanese", "Korean", "Malaysian", "Middle Eastern", "Midterranean",  "Mongolian", "Moroccan", "Persian", "Polish", "Portueguese", "Russian", "Singaporean", "Spanish", "Swedish", "Thai", "Turkish", "Vietnamese"]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return history.count
    }
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = history[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
        }
        else{
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
