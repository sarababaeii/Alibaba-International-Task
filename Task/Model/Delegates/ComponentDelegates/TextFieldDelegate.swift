//
//  TextFieldDelegate.swift
//  Task
//
//  Created by Sara Babaei on 2/7/22.
//

import UIKit

class TextFieldDelegate: NSObject, UITextFieldDelegate {
    
    var viewController: FormViewController
    
    //MARK: Initialization
    init(viewController: FormViewController) {
        self.viewController = viewController
    }
    
    //MARK: Begin Editing
    func textFieldDidBeginEditing(_ textField: UITextField) {
        viewController.currentTextField = textField
    }
    
    //MARK: Change Editing
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        print(textField.fetchInput())
//        print(string)
//        print(range)
        for tf in viewController.textFields {
            if isTextFieldEmpty(tf, currentTextField: textField, replacementString: string, range: range) {
                viewController.searchButton.changeAbility(to: false)
                return true
            }
        }
        viewController.searchButton.changeAbility(to: true)
        return true
    }
    
    private func isTextFieldEmpty(_ textField: UITextField, currentTextField: UITextField, replacementString string: String, range: NSRange) -> Bool {
        switch textField.tag {
        case currentTextField.tag:
            return (string == "" &&
                        (textField.fetchInput() == nil ||
                            (textField.fetchInput()?.count == range.upperBound && range.lowerBound == 0))) ||
                (string == " " && textField.fetchInput() == nil)
        default:
            return textField.fetchInput() == nil
        }
    } //TODO: "  h\"

    //MARK: End Editing
    func textFieldDidEndEditing(_ textField: UITextField) {
        getTextData(textField)
    }
    
    func getTextData(_ textField: UITextField) {
        if let text = textField.fetchInput() {
            viewController.data[textField.tag] = text
        } else {
            viewController.data[textField.tag] = ""
        }
    }
    
    //MARK: Return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if viewController.textFields.count > textField.tag + 1 {
            viewController.textFields[textField.tag + 1].becomeFirstResponder()
        }
        return true
    }
}
