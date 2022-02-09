//
//  SearchViewController.swift
//  Task
//
//  Created by Sara Babaei on 2/6/22.
//

import UIKit

class SearchViewController: DestinationyViewController {

    @IBOutlet weak var originTextField: BottomBorderedTextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var callback: ((String) -> Void)?
    
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
    
    override func initializeTextFields() {
        textFields = [originTextField, destinationTextField]
    }
    
    @IBAction func search(_ sender: Any) {
        if let destination = destinationTextField.fetchInput() {
            callback?(destination)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
}
