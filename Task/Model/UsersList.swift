//
//  UsersList.swift
//  Task
//
//  Created by Sara Babaei on 2/9/22.
//

import Foundation

struct UsersList {
    var page: Int
    var totalPages: Int
    var users: [User]
}

extension UsersList: Decodable {
    enum CodingKeys: String, CodingKey {
        case page
        case totalPages
        case users = "data"
    }
}
