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
    
//    //MARK: Clinitick Blog
//    private static let blogServer = "https://blog.clinitick.com/"
//    private static let blogBase = APIAddress.blogServer + "wp-json/wp/v2/"
//
//    private static let posts = APIAddress.blogBase + "posts"
//
//    public static let media = APIAddress.blogBase + "media/"
//
//    static let listPostsURL = URL(string: APIAddress.posts)!
}
