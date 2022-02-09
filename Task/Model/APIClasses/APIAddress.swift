//
//  APIAddress.swift
//  Task
//
//  Created by Sara Babaei on 2/8/22.
//

import Foundation

struct APIAddress {
    
    private static let server = "https://reqres.in/"
    private static let base = APIAddress.server + "api/"
    
    private static let users = APIAddress.base + "users"
    
    static let getUsersURL = URL(string: APIAddress.users)!
}
