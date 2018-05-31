//
//  APIDetailViewController.swift
//  PublicAPI Viewer
//
//  Created by Ben Adams on 5/30/18.
//  Copyright © 2018 Ben Adams. All rights reserved.
//

import UIKit 

class APIDetailViewController: UIViewController {
    
    


    @IBOutlet weak var apiLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var authLabel: UILabel!
    @IBOutlet weak var httpsLabel: UILabel!
    @IBOutlet weak var corsLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    @IBOutlet weak var categoryLabe: UILabel!
    
    
    var apiDetail: openAPI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        guard let apiDetail = apiDetail, self.isViewLoaded else { return }
        apiLabel.text = ("\(apiDetail.title)")
        descriptionLabel.text = ("Description: \(apiDetail.description)")
        authLabel.text = ("Authorization Type: \(apiDetail.auth)")
        httpsLabel.text = ("HTTPS Compatible: \(apiDetail.https)")
        corsLabel.text = ("CORS Compatible: \(apiDetail.cors)")
        linkLabel.text = ("URL: \(apiDetail.link)")
        categoryLabe.text = ("Category: \(apiDetail.category)")
    
        
    }
}
