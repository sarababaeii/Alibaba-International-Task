//
//  ViewController.swift
//  Task
//
//  Created by Sara Babaei on 2/5/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var welcomeView: BlueBorderedView!
    @IBOutlet weak var destinationTextField: UITextField!
    @IBOutlet weak var searchDestinationButton: AccentButton!
    @IBOutlet weak var usersTableView: UITableView!
    
    var usersTableViewDelegate: UsersTableViewDelegates?
    
    //MARK: Navigation Bar Visibility
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBarHidden(true)
    }
    
    //MARK: Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        let users = generateUsers()
        setDelegates(users: users)
    }
    
    //MARK: Top Users
    private func setDelegates(users: [User]) {
        setTableViewDelegate(for: users)
    }
    
    private func setTableViewDelegate(for users: [User]) {
        usersTableViewDelegate = UsersTableViewDelegates(users: users, usersTableView: usersTableView)
        usersTableView.delegate = usersTableViewDelegate
        usersTableView.dataSource = usersTableViewDelegate
    }
    
    private func generateUsers() -> [User] {
        var users = [User]()
        for _ in 0 ..< 3 {
            users.append(User(name: "George Bluth", email: "george.bluth@reqres.in", image: UIImage(named: "1-image")!))
        }
        return users
    }
    
    @IBAction func closeWelcomeView(_ sender: Any) {
    }
    
    @IBAction func searchDestination(_ sender: Any) {
    }
    
}


//TODO: Scaling for imageview
//TODO: Resizing email label text
//TODO: Rearranging user labels
//TODO: Button functions

//TODO: API Management
