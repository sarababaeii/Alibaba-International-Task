//
//  SearchViewController.swift
//  Task
//
//  Created by Sara Babaei on 2/6/22.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchButton: AccentButton!
    
    //MARK: Navigation Bar Visibility
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBarHidden(false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func search(_ sender: Any) {
    }
    
}

