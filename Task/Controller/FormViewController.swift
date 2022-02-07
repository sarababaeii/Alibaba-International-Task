//
//  FormViewController.swift
//  Task
//
//  Created by Sara Babaei on 2/7/22.
//

import UIKit

class FormViewController: UIViewController {
    
    
    @IBOutlet weak var searchButton: AccentButton!
    
    var textFields = [UITextField]()
    var textFieldDelegates = [TextFieldDelegate]()
    var data = [String]()
    
    //MARK: Initialization
    func configure() {
        initializeTextFields()
        setTextFieldDelegates()
        initializeData()
    }
    
    func initializeTextFields() {
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
}
