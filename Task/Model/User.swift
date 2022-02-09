//
//  User.swift
//  Task
//
//  Created by Sara Babaei on 2/6/22.
//

import Foundation

class User: Decodable {
    
    var id: Int
    var firstName: String
    var lastName: String
    var email: String
    var avatarURL: URL
    private var avatarData: Data?
    
    init(id: Int, firstName: String, lastName: String, email: String, avatarURL: URL) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.avatarURL = avatarURL
    }
    
    func getAvatarData(_ completion: @escaping (Data?) -> ()) {
        if let data = avatarData {
            completion(data)
        } else {
            setAvatarData(completion)
        }
    }
    
    private func setAvatarData(_ completion: @escaping (Data?) -> ()) {
        REST_API_Manager.sharedInstance.getAvatarData(for: self, { data in
            if let data = data {
                self.avatarData = data
                completion(data)
            }
        })
    }
}

extension User {
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName
        case lastName
        case email
        case avatarURL = "avatar"
    }
}
