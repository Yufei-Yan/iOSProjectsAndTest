//
//  RootViewController.swift
//  Prog3yzy0050Fa16
//
//  Created by Yan on 11/10/16.
//  Copyright © 2016 Yan. All rights reserved.
//

import UIKit

class RootViewController: UITableViewController {
    
    fileprivate static let autoCell = "Automobiles"
    
//    static var auto = [
//                   ["1957", "Chevrolet", "Bel Air", "5", ""],
//                   ["2016", "New", "Model", "5", ""],
//                   ["1972", "Ford", "F-100", "3", ""]
//    ]
    
        static var auto = [
            ["2016", "New Car", "New Model", "5", ""],
        ]
    
//    static var auto = [
//                "1967 Chevrolet BelAir 5 ",
//                "2016 New Model 5 ",
//                "1972 Ford F-100 3 "
//    ]
    
    var addAuto: [String] = []
    var isAppend: Bool = false
    var isFromAdd: Bool = false
    
    let simpleTableIdentifier = "SimpleTableIdentifier"

    @IBOutlet weak var buttonAdd: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem

        if isAppend == true {
            isAppend = false
            RootViewController.auto.append(addAuto)
            let fileURL = self.dataFileURL()
            let array = (RootViewController.auto as NSArray)
            array.write(to: fileURL as URL, atomically: true)
        }
        
        // persist data in a file
        let fileURL = self.dataFileURL()
        if (FileManager.default.fileExists(atPath: fileURL.path!)) {
            print("OK")
            let array = NSArray(contentsOf: fileURL as URL) as? [[String]]
            //let contentData = FileManager.default.contents(atPath: fileURL)
            //let content = NSString(data: contentData!, encoding: String.Encoding.utf8.rawValue) as! String
            let content = try! String(contentsOf: fileURL as URL)
            print(content)
            print(array![0][0])
            if !isFromAdd {
                RootViewController.auto.removeAll()
            }
            for i in 0 ..< (array?.count)! {
                RootViewController.auto.append((array?[i])!)
            }
        } else {
            
            let array = (RootViewController.auto as NSArray)
            array.write(to: fileURL as URL, atomically: true)
        }
        
        let app = UIApplication.shared
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.applicationWillResignActive(notification:)),
                                               name: NSNotification.Name.UIApplicationWillResignActive,
                                               object: app)
    }
    
    // used for refresh table
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return RootViewController.auto.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RootViewController.autoCell, for: indexPath)
        
//        if (cell == nil) {
//            cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: simpleTableIdentifier)
//        }
        //let w = auto[indexPath.section]
        //var condition = w[indexPath.row]
//        let automobile = RootViewController.auto[indexPath.row]
//        let automobileArr = automobile.characters.split(separator: " ").map(String.init)
//        let year = automobileArr[0]
//        let make = automobileArr[1]
//        let model = automobileArr[2]
//        let condition = automobileArr[3]
        //print(automobile)
        let automobile = RootViewController.auto[indexPath.row]
        
        let year = automobile[0]
        let make = automobile[1]
        let model = automobile[2]
        let condition = automobile[3]

        cell.detailTextLabel?.text = "Condition: \(condition)"
        
        //var indexPathRow = indexPath.row
        cell.textLabel?.text = "\(year) \(make) \(model)"
        
        return cell
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "autoCell" {
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)!
            let listVC = segue.destination as! DetailController
        
            listVC.navigationItem.title = "Automobile Details"
            listVC.autoInfo = RootViewController.auto[indexPath.row]
        } else if segue.identifier == "addAuto" {
            let listVC = segue.destination as! AddController
            
            listVC.navigationItem.title = "Add Automobile"
        }

    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        //print("in edit")
        if editingStyle == .delete {
            // Delete the row from the data source
            RootViewController.auto.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let item = RootViewController.auto[fromIndexPath.row]
        RootViewController.auto.remove(at: fromIndexPath.row)
        RootViewController.auto.insert(item, at: to.row)
    }
    
    func dataFileURL() -> NSURL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentUrl = urls.first
        return documentUrl!.appendingPathComponent("data.plist") as NSURL
    }
    
    func applicationWillResignActive(notification: NSNotification) {
        let fileURL = self.dataFileURL()
        let array = (RootViewController.auto as NSArray)
        array.write(to: fileURL as URL, atomically: true)
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
