//
//  REST_API_Result.swift
//  Task
//
//  Created by Sara Babaei on 2/8/22.
//

import Foundation

struct REST_API_Result {
    
    var data: Data?
    var response: HTTPURLResponse?
    var error: Error?
    
    func getUsersList() -> [User]? {
        guard let data = data else {
            return nil
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try? decoder.decode(UsersList.self, from: data).users
    }
}
