//
//  TagVC.swift
//  tagSearchExample
//
//  Created by RAG on 25/07/2019.
//  Copyright © 2019 RAG. All rights reserved.
//

import UIKit

class TagVC: UIViewController, UITableViewDataSource, UISearchResultsUpdating {
    
    @IBOutlet weak var tableTag: UITableView!
    
    let data = ["New York, NY", "Los Angeles, CA", "Chicago, IL", "Houston, TX",
                "Philadelphia, PA", "Phoenix, AZ", "San Diego, CA", "San Antonio, TX",
                "Dallas, TX", "Detroit, MI", "San Jose, CA", "Indianapolis, IN",
                "Jacksonville, FL", "San Francisco, CA", "Columbus, OH", "Austin, TX",
                "Memphis, TN", "Baltimore, MD", "Charlotte, ND", "Fort Worth, TX"]
    
    var filteredData: [String]!
    
    var searchController: UISearchController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = " Tags... "
        
        tableTag.dataSource = self
        filteredData = data
        
        // Initializing with searchResultsController set to nil means that
        // searchController will use this view controller to display the search results
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        
        // If we are using this same view controller to present the results
        // dimming it out wouldn't make sense. Should probably only set
        // this to yes if using another controller to display the search results.
        searchController.dimsBackgroundDuringPresentation = false
        
        searchController.searchBar.sizeToFit()
        tableTag.tableHeaderView = searchController.searchBar
//        tagSearchBar.sizeToFit()
//        tableTag.tableHeaderView = tagSearchBar

        
        // Sets this view controller as presenting view controller for the search interface
        definesPresentationContext = true
    }
    
}

extension TagVC {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        if let searchText = searchController.searchBar.text {
            filteredData = searchText.isEmpty ? data : data.filter({(dataString: String) -> Bool in
                return dataString.range(of: searchText, options: .caseInsensitive) != nil
            })
            
            tableTag.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableTag.dequeueReusableCell(withIdentifier: "TagSearchCell") as! TagResultsCell
        cell.textLabel?.text = filteredData![indexPath.row]
        return cell
        
    }
    
}
