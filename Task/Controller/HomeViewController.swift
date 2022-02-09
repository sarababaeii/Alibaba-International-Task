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
        setTopUsers()
        setTableViewDelegate(for: [User]())
    }
    
    override func initializeTextFields() {
        textFields = [destinationTextField]
    }
    
    //MARK: Top Users
    private func setTopUsers() {
        REST_API_Manager.sharedInstance.getUsers({(users) in
            DispatchQueue.main.async {
                if let users = users {
                    self.usersTableViewDelegate?.updateUsers(to: users)
                } else {
                    self.showToast(message: "Error in fetching users.", backgroundColor: .red, textColor: .white)
                }
            }
        })
    }
    
    private func setTableViewDelegate(for users: [User]) {
        usersTableViewDelegate = UsersTableViewDelegates(users: users, usersTableView: usersTableView)
        usersTableView.delegate = usersTableViewDelegate
        usersTableView.dataSource = usersTableViewDelegate
    }
    
    //MARK: Buttons Functionalities
    @IBAction func closeWelcomeView(_ sender: Any) {
        hideKeyboard(sender)
        hideView(welcomeView, in: 1.0, damping: 0.5, initialVelocity: 0.5)
    }
    
    private func hideView(_ view: UIView, in time: TimeInterval, damping: CGFloat, initialVelocity: CGFloat) {
        UIView.animate(withDuration: time, delay: 0, usingSpringWithDamping: damping, initialSpringVelocity: initialVelocity, options: .allowUserInteraction, animations: {
            view.alpha = 0
            self.usersViewTopConstraint.constant = 24
            self.usersViewTopConstraint.isActive = true
            self.view.layoutIfNeeded()
           }, completion: {_ in
            view.isHidden = true
          })
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
