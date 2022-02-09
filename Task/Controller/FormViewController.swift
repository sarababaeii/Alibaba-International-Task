//
//  FormViewController.swift
//  Task
//
//  Created by Sara Babaei on 2/7/22.
//

import UIKit

protocol Form {
    func initializeTextFields()
}

class FormViewController: UIViewController {
    
    @IBOutlet weak var searchButton: AccentButton!
    
    var textFields = [UITextField]()
    var currentTextField: UITextField?
    var textFieldDelegates = [TextFieldDelegate]()
    var data = [String]()
    
    //MARK: Initialization
    func configure(_ form: Form) {
        form.initializeTextFields()
        setTextFieldDelegates()
        initializeData()
    }
    
    private func setTextFieldDelegates() {
        for i in 0 ..< textFields.count {
            textFieldDelegates.append(TextFieldDelegate(viewController: self))
            textFields[i].delegate = textFieldDelegates[i]
        }
    }
    
    private func initializeData() {
        for _ in 0 ..< textFields.count {
            data.append("")
        }
    }
    
    @IBAction func hideKeyboard(_ sender: Any) {
        if let textField = currentTextField {
            textField.resignFirstResponder()
        }
    }
}
