//
//  SearchViewController.swift
//  Task
//
//  Created by Sara Babaei on 2/6/22.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var originTextField: BottomBorderedTextField!
    @IBOutlet weak var destinationTextField: BottomBorderedTextField!
    @IBOutlet weak var searchButton: UIButton!
    
    var destination = ""
    
    //MARK: Navigation Bar Visibility
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBarHidden(false)
    }
    
    //MARK: Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        setDestinationText(to: destination)
    }

    private func setDestinationText(to dest: String) {
        destinationTextField.text = dest
    }
    
    @IBAction func search(_ sender: Any) {
    }
    
}
