//
//  UserTableViewDelegate.swift
//  Task
//
//  Created by Sara Babaei on 2/6/22.
//

import UIKit

class UsersTableViewDelegates: NSObject, UITableViewDelegate, UITableViewDataSource {
   
    var users: [User]
    var tableView: UITableView

    //MARK: Initializer
    init(users: [User], usersTableView: UITableView) {
        self.users = users
        self.tableView = usersTableView
    }
    
    //MARK: Protocol Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String.userCellID, for: indexPath) as! UserTableViewCell
        if let user = usersDataSource(at: indexPath) {
            cell.setAttributes(for: user)
            setImage(for: user, at: cell)
        }
        return cell
    }
    
    private func setImage(for user: User, at cell: UserTableViewCell) {
        user.getAvatarData({ data in
            if let data = data,
               let img = UIImage(data: data) {
                DispatchQueue.main.async {
                    cell.setImage(to: img)
                }
            }
        })
    }
    
    func usersDataSource(at indexPath: IndexPath) -> User? {
        if indexPath.row < users.count {
            return users[indexPath.row]
        }
        return nil
    }

    //MARK: Functions
    func updateUsers(to users: [User]) {
        self.users = users
        self.tableView.reloadData()
    }
    
    func insertUser(_ user: User) {
        let indexPath = getNewIndexPath()
        users.insert(user, at: indexPath.row)
        insertUserToTable(user, at: indexPath)
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }

    private func getNewIndexPath() -> IndexPath {
        return IndexPath(row: users.count, section: 0)
    }

    private func insertUserToTable(_ user: User, at indexPath: IndexPath) {
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
    }
}
