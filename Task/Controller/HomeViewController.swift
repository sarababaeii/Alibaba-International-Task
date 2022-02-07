//
//  ViewController.swift
//  Task
//
//  Created by Sara Babaei on 2/5/22.
//

import UIKit

class HomeViewController: DestinationyViewController {

    @IBOutlet weak var welcomeView: UIView!
    @IBOutlet weak var usersTableView: UITableView!
    @IBOutlet weak var usersViewTopConstraint: NSLayoutConstraint!
    
    var usersTableViewDelegate: UsersTableViewDelegates?
    
    //MARK: Navigation Bar Visibility
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBarHidden(true)
        setDestinationText(to: destination)
    }
    
    //MARK: Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func configure() {
        super.configure()
        let users = generateUsers()
        setTableViewDelegate(for: users)
    }
    
    override func initializeTextFields() {
        textFields = [destinationTextField]
    }
    
    //MARK: Top Users
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
    
    @IBAction func searchDestination(_ sender: Any) {
        self.activeSegue(with: .homeToSearchSegue)
    }
    
    //MARK: Sending Destination to Search Page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == .homeToSearchSegue,
           let destination = destinationTextField.fetchInput(),
           let viewController = segue.destination as? SearchViewController {
            self.destination = destination
            viewController.destination = destination
            viewController.callback = { message in
                self.destination = message
            }
        }
    }
}

//TODO: API Management
//TODO: Animation
