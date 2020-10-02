//
//  ProfileInfoExtension.swift
//  CowrywiseClone
//
//  Created by Tim on 02/10/2020.
//

import UIKit

extension ProfileScreenController : profileDataProtocol {
    func fetchUserData(userData: user) {
        if let encoded = try? JSONEncoder().encode(userData) {
            UserDefaults.standard.set(encoded, forKey: "profileData")
        }
    }
}
