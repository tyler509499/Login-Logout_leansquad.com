//
//  Model.swift
//  Login-Logout_leansquad.com
//
//  Created by Galkov Nikita on 18.02.2021.
//

import Foundation

class AuthorizationModelData {
    static var accessToken: String?
}

class JsonModel {
    struct AuthorizationResponse: Codable {
        var accessToken: String
        var csrf: String
        var user: User
        
        enum CodingKeys: String, CodingKey {
            case accessToken = "access_token"
            case csrf
            case user
        }
    }
    
    struct User: Codable {
        var id: String
        var firstName: String
        var lastName: String
        var email: String
        var lastSeenAt: Int?
        var projectId: String
        var prototypeOwner: Bool?
        
        enum CodingKeys: String, CodingKey {
            case id
            case firstName = "first_name"
            case lastName = "last_name"
            case email
            case lastSeenAt = "last_seen_at"
            case projectId = "project_id"
            case prototypeOwner = "protoype_owner"
        }
        
    }
    
}
