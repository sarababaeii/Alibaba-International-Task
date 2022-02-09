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
    
    func getUsers(_ completion: @escaping ([User]?) -> ()) {
        let getUsersRequest = createGetUsersRequest()
        getUsersRequest.execute({ result in
            let users = result.getUsersList()
            completion(users)
        })
    }
}
