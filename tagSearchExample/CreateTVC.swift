//
//  CreateTVC.swift
//  tagSearchExample
//
//  Created by RAG on 25/07/2019.
//  Copyright © 2019 RAG. All rights reserved.
//

import UIKit

class CreateTVC: UITableViewController {
    
    
    @IBOutlet weak var createTV: UITableView!
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        self.navigationItem.title = " Create... "
        createTV.tableFooterView = UIView()
    }
    
}

extension CreateTVC {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "createCell_id", for: indexPath)
        cell.textLabel?.text = "Add Tags"
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "segueToTag", sender: indexPath)
        
    }
    
    
}
