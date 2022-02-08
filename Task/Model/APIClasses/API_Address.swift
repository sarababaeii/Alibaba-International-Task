//
//  API_Address.swift
//  Task
//
//  Created by Sara Babaei on 2/8/22.
//

import Foundation

struct API_Address {
    
    private static let server = "https://reqres.in/"
    private static let base = API_Address.server + "api/"
    
    private static let users = API_Address.base + "users"
    
    static let getUsersURL = URL(string: API_Address.users)!
    
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
