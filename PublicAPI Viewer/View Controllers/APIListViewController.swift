//
//  APIListViewController.swift
//  PublicAPI Viewer
//
//  Created by Ben Adams on 5/30/18.
//  Copyright © 2018 Ben Adams. All rights reserved.
//

import UIKit

class APIListViewController: UIViewController {
    
    struct Constants {
        static let termCellID = "apiCell"
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        
    }
    
}

extension APIListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let apis = APIController.apiSearch else {
            return 0
        }
        return apis.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let apis = APIController.apiSearch else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.termCellID, for: indexPath)
        cell.textLabel?.text = apis[indexPath.row].api
        cell.detailTextLabel?.text = apis[indexPath.row].description
        
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            let destinationVC = segue.destination as? APIDetailViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                let transferredAPI = APIController.apiSearch?[indexPath.row]
                destinationVC?.apiDetail = transferredAPI
            }
        }
    }
}
