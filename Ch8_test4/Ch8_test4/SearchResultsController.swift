//
//  SearchResultsController.swift
//  Ch8_test4
//
//  Created by Yan on 11/8/16.
//  Copyright © 2016 Yan. All rights reserved.
//

import UIKit

class SearchResultsController: UITableViewController, UISearchResultsUpdating {
    
    private static let longNameSize = 6
    private static let shortNamesButtonIndex = 1
    private static let longNamesButtonIndex = 2

    let sectionsTableIdentifier = "SectionsTableIdentifier"
    var names:[String: [String]] = [String: [String]]()
    var keys: [String] = []
    var filteredNames: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: sectionsTableIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UISearchResultsUpdating Conformance
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
        var searchString = ""
        var buttonIndex = 0
        
        if ((searchString = searchController.searchBar.text!) && (buttonIndex = searchController.searchBar.selectedScopeButtonIndex))
        {filteredNames.removeAll(keepingCapacity: true)}
        if !searchString.isEmpty {
            let filter: (String) -> Bool = { name in
                // Filter out long or short names depending on which
                // scope button is selected.
                let nameLength = name.characters.count
                if (buttonIndex == SearchResultsController.shortNamesButtonIndex
                    && nameLength >= SearchResultsController.longNameSize)
                    || (buttonIndex == SearchResultsController.longNamesButtonIndex
                        && nameLength < SearchResultsController.longNameSize) {
                    return false
                }
                let range = name.rangeOfString(searchString, options: NSString.CompareOptions.CaseInsensitiveSearch)
                return range != nil
            }
            
            for key in keys {
                let namesForKey = names[key]!
                let matches = namesForKey.filter(filter)
                filteredNames += matches
            }
        }
        tableView.reloadData()
    }
}

   
}
