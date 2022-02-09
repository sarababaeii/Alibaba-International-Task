//
//  Strings.swift
//  Task
//
//  Created by Sara Babaei on 2/6/22.
//

import Foundation

extension String {
    
    //MARK: ViewController Identifiers
    static var navigationController: String {
        return "MainNavigationControllerID"
    }
    
    static var homeViewController: String {
        return "HomeViewControllerID"
    }
    
    static var searchViewController: String {
        return "SearchViewControllerID"
    }
    
    //MARK: Segue Identifiers
    static var homeToSearchSegue: String {
        return "HomeToSearchSegue"
    }
    
    //MARK: Cell Identifiers
    static var userCellID: String {
        return "UserCellID"
    }
    
    //MARK: Image Names
    static var closeButtonImage: String {
        return "xmark"
    }
    
    //MARK: Page Titles
    static var searchTitle: String {
        return "Search"
    }
}
