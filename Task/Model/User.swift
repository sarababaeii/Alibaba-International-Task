//
//  User.swift
//  Task
//
//  Created by Sara Babaei on 2/6/22.
//

import UIKit

struct User {
    
    var id: Int
    var firstName: String
    var lastName: String
    var email: String
    var avatarLink: URL
    var avatar: UIImage?
}

extension User: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case firstName
        case lastName
        case email
        case avatarLink = "avatar"
    }
}
