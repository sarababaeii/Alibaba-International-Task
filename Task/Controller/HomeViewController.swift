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
//        let users = generateUsers()
//        setTableViewDelegate(for: users ?? [User]())
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
    
    private func generateUsers() -> [User]? {
        let json = """
            {
                "page":1,
                "per_page":6,
                "total":12,
                "total_pages":2,
                "data":[
                    {
                        "id":1,
                        "email":"george.bluth@reqres.in",
                        "first_name":"George",
                        "last_name":"Bluth",
                        "avatar":"https://reqres.in/img/faces/1-image.jpg"
                    },
                    {
                        "id":2,
                        "email":"janet.weaver@reqres.in",
                        "first_name":"Janet",
                        "last_name":"Weaver",
                        "avatar":"https://reqres.in/img/faces/2-image.jpg"
                    },
                    {
                        "id":3,
                        "email":"emma.wong@reqres.in",
                        "first_name":"Emma",
                        "last_name":"Wong",
                        "avatar":"https://reqres.in/img/faces/3-image.jpg"},
                    {
                        "id":4,
                        "email":"eve.holt@reqres.in",
                        "first_name":"Eve",
                        "last_name":"Holt",
                        "avatar":"https://reqres.in/img/faces/4-image.jpg"
                    },
                    {
                        "id":5,
                        "email":"charles.morris@reqres.in",
                        "first_name":"Charles",
                        "last_name":"Morris",
                        "avatar":"https://reqres.in/img/faces/5-image.jpg"
                    },
                    {
                        "id":6,
                        "email":"tracey.ramos@reqres.in",
                        "first_name":"Tracey",
                        "last_name":"Ramos",
                        "avatar":"https://reqres.in/img/faces/6-image.jpg"
                    }
                ],
                "support":{
                    "url":"https://reqres.in/#support-heading",
                    "text":"To keep ReqRes free, contributions towards server costs are appreciated!"
                }
            }

        """.data(using: .utf8)!
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        if let usersList = try? decoder.decode(UsersList.self, from: json) {
            print(usersList)
            print("^^^^^^^")
            return usersList.users
        }
        print("Failed")
        return nil
//        var users = [User]()
//        for _ in 0 ..< 4 {
//            users.append(User(id: 1, firstName: "George", lastName: "Bluth", email: "george.bluth@reqres.in", avatarLink: URL(string: "https://reqres.in/img/faces/1-image.jpg")!))
//        }
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
