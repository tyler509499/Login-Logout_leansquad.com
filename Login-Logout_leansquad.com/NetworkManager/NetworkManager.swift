//
//  NetworkManager.swift
//  Login-Logout_leansquad.com
//
//  Created by Galkov Nikita on 18.02.2021.
//

import Foundation
import Alamofire

class NetworkManager {
//MARK: - Login Request with Parameters using Alamofire and save accessToken in storage after decoding JSON by Codable
    func loginRequest(email: String , password: String, completion: @escaping(_ JSONResponse : Any?, _ error: Error?) -> ()){
        guard let url = URL(string: Url.requestUrl) else {
            return
        }
        
        let parametres = ["email": email, "password": password, "project_id": Parameters.requestProjectId]
        
        AF.request(url, method: .post, parameters: parametres, encoding: JSONEncoding.default, headers: [:]).responseJSON { (response) in
            switch response.result {
            case .success:
                guard let jsonData = response.data else {
                    return
                }
                do {
                    let result = try JSONDecoder().decode(JsonModel.AuthorizationResponse.self, from: jsonData)
                    AuthorizationModelData.accessToken = result.accessToken
                } catch {
                    print("Error: \(error)")
                }
                completion(jsonData, nil)
            case .failure (let error):
                completion(nil, error)
            }
        }
    }
}

