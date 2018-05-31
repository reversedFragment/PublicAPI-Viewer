//
//  APISearchViewController.swift
//  PublicAPI Viewer
//
//  Created by Ben Adams on 5/30/18.
//  Copyright © 2018 Ben Adams. All rights reserved.
//

import UIKit

class APISearchViewController : UIViewController {
    
    struct Constants {
        static let segueToTableID = "showTableViewSegue"
    }
    
    @IBOutlet weak var searchAPITextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func searchButtonTapped(_ sender: Any) {
        APIController.apiSearch = nil
    
        guard let descriptionToSearch = searchAPITextField.text else {
            return
        }
        guard let titleToSearch = searchAPITextField.text else {
            return
        }
        
        APIController.fetchAPIs(searchByDescription: descriptionToSearch) {
            if APIController.apiSearch != nil {
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: Constants.segueToTableID, sender: nil)
                    
                }
            }
            else if APIController.apiSearch == nil {
                APIController.fetchAPITitle(searchByTitle: titleToSearch) {
                    if APIController.apiSearch != nil {
                        DispatchQueue.main.async {
                            self.performSegue(withIdentifier: Constants.segueToTableID, sender: nil)
                        }
                    } else {
                        DispatchQueue.main.async {
                            let alert = UIAlertController(title: nil, message: "No APIs Found", preferredStyle: .alert)
                            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                            alert.addAction(cancelAction)
                            self.present(alert, animated: true, completion: nil)
                            
                        }
                    }
                }
            }
        }
    }
}

