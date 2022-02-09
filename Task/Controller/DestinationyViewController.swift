//
//  DestinationyViewController.swift
//  Task
//
//  Created by Sara Babaei on 2/7/22.
//

import UIKit

class DestinationyViewController: FormViewController {
    
    @IBOutlet weak var destinationTextField: UITextField!
    
    var destination = ""
    
    //MARK: Initialization
    override func configure(_ form: Form) {
        super.configure(form)
        setDestinationText(to: destination)
    }
    
    func setDestinationText(to dest: String) {
        destinationTextField.text = dest
    }
}
