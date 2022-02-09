//
//  URLRequest.swift
//  Task
//
//  Created by Sara Babaei on 2/9/22.
//

import Foundation

extension URLRequest {
    func execute(_ completion: @escaping (REST_API_Result) -> ()) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: self) { (data, response, error) in
            if let data = data {
                let responseString = String(data: data, encoding: .utf8)
                print("My response --> \(String(describing: responseString))\n")
            }
            let result = REST_API_Result(data: data, response: response as? HTTPURLResponse)
            completion(result)
        }
        task.resume()
    }
}
