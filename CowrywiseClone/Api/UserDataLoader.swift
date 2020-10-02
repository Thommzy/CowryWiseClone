//
//  UserDataLoader.swift
//  CowrywiseClone
//
//  Created by Tim on 02/10/2020.
//

import Foundation

class UserDataLoader {
    
    var loadUserDelegate : profileDataProtocol?
    
    func loadUserData() {
        let baseUrl : String = Constants.baseUrl
        let id : Int = 12
        let userUrl = "\(baseUrl)/profile/\(id)"
        guard let url = URL(string: userUrl) else { return }
        let session = URLSession.shared
        session.dataTask(with: url) {(data, response, error) in
            if let data = data {
                do {
                    let jsonDecoder = JSONDecoder()
                    let dataFromJson = try jsonDecoder.decode(user.self, from: data)
                    self.loadUserDelegate?.fetchUserData(userData: dataFromJson)
                } catch  {
                }
            }
        }.resume()
    }
}
