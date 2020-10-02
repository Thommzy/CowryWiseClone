//
//  ProfileDataModel.swift
//  CowrywiseClone
//
//  Created by Tim on 02/10/2020.
//

import Foundation


struct user: Codable {
    let firstName, lastName, username, dateOfBirth, nextOfKin, postalAddress, email, phoneNumber: String
    let gender: Bool
}
