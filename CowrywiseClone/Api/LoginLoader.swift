//
//  LoginDataLoader.swift
//  CowrywiseClone
//
//  Created by Tim on 03/10/2020.
//

import Foundation


class LoginLoader {
    
    var loginUserDelegate : loginProtocol?
    
    func loadUserData() {
        let baseUrl : String = Constants.baseUrl
        let loginUrl : String = "\(baseUrl)/login"
        guard let url = URL(string: loginUrl) else { return }
        var loginRequest = URLRequest(url: url)
        loginRequest.httpMethod = "POST"
        do {
            let params = ["emailAdress": "timothyobeisun@gmail.com", "password": "123123"]
            loginRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: .init())
            URLSession.shared.dataTask(with: loginRequest) {(data, res, error) in
                
                if let data = data {
                    do {
                        let jsonDecoder = JSONDecoder()
                        let dataFromJson = try jsonDecoder.decode(LoginModel.self, from: data)
                        self.loginUserDelegate?.login(loginResponse: dataFromJson)
                    } catch  {
                    }
                }
                if let err = error {
                    print(err)
                }
                return
            }.resume()
        } catch {
            print("Failed to serialize Data", error)
        }
        
    }
}
