//
//  REST_API_Manager.swift
//  Task
//
//  Created by Sara Babaei on 2/8/22.
//

import Foundation

class REST_API_Manager {
    static let sharedInstance = REST_API_Manager()
    
    private init() {
    }
    
    //MARK: Creating A Request
    private func createGetRequest(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }
    
    //MARK: Creating Specific Request
    private func createGetUsersRequest() -> URLRequest {
        return createGetRequest(url: APIAddress.getUsersURL)
    }
    
    private func createGetAvatarRequest(for user: User) -> URLRequest {
        return createGetRequest(url: user.avatarURL)
    }
    
    //MARK: Interface Functions
    func getUsers(_ completion: @escaping ([User]?) -> ()) {
        let request = createGetUsersRequest()
        request.execute({ result in
            let users = result.getUsersList()
            completion(users)
        })
    }
    
    func getAvatarData(for user: User, _ completion: @escaping (Data?) -> ()) {
        let request = createGetAvatarRequest(for: user)
        request.execute({result in
            completion(result.data)
        })
    }
}
