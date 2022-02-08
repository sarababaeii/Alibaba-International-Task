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
    
    //MARK: Sending A Request
    private func sendRequest(request: URLRequest, type: API_RequestType, _ completion: @escaping (REST_API_Result) -> ()) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                let responseString = String(data: data, encoding: .utf8)
                print("\(type)\nMy response --> \(String(describing: responseString))")
            }
            let result = REST_API_Result(data: data, response: response as? HTTPURLResponse)
            completion(result)
        }
        task.resume()
    }
    
    //MARK: Creating A Request
    private func createGetRequest(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }
    
    //MARK: Creating Specific Request
    private func createGetUsersRequest() -> URLRequest {
        return createGetRequest(url: API_Address.getUsersURL)
    }
    
    func getUsers() {
        sendRequest(request: createGetUsersRequest(), type: .getUsers, {_ in })
    }
}
