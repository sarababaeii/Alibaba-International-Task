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
        session.dataTask(with: self) {(data, response, error) in
            let result = REST_API_Result(data: data, response: response as? HTTPURLResponse)
            completion(result)
        }.resume()
    }
}
