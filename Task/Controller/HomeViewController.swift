//
//  ViewController.swift
//  Task
//
//  Created by Sara Babaei on 2/5/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var welcomeView: UIView!
    @IBOutlet weak var destinationTextField: UITextField!
    @IBOutlet weak var searchDestinationButton: AccentButton!
    @IBOutlet weak var usersTableView: UITableView!
    @IBOutlet weak var usersViewTopConstraint: NSLayoutConstraint!
    
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
        for _ in 0 ..< 4 {
            users.append(User(name: "George Bluth", email: "george.bluth@reqres.in", image: UIImage(named: "1-image")!))
        }
        return users
    }
    
    //MARK: Buttons Functionalities
    @IBAction func closeWelcomeView(_ sender: Any) {
        welcomeView.isHidden = true
        usersViewTopConstraint.constant = 24
        usersViewTopConstraint.isActive = true
    }
    
    @IBAction func destinationTextFieldIsEditing(_ sender: Any) {
        if let _ = destinationTextField.fetchInput() {
            searchDestinationButton.changeAbility(to: true)
        } else {
            searchDestinationButton.changeAbility(to: false)
        }
    }
    
    @IBAction func searchDestination(_ sender: Any) {
        self.activeSegue(with: .homeToSearchSegue)
    }
    
    //MARK: Sending Destination to Search Page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == .homeToSearchSegue,
           let destination = destinationTextField.fetchInput(),
            let viewController = segue.destination as? SearchViewController {
                viewController.destination = destination
        }
    }
}

//TODO: API Management
//TODO: Animation
