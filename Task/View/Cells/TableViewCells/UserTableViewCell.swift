//
//  UserTableViewCell.swift
//  Task
//
//  Created by Sara Babaei on 2/6/22.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    
    func setAttributes(for user: User) {
        setName(for: user)
        setEmail(for: user)
        setImage(for: user)
    }
    
    private func setName(for user: User) {
        userNameLabel.text = user.name
    }
    
    private func setEmail(for user: User) {
        userEmailLabel.text = user.email
    }
    
    private func setImage(for user: User) {
        userImageView.image = user.image
    }
}
