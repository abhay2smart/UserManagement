//
//  AddUserModel.swift
//  UserManagement
//
//  Created by Abhayjeet Singh on 19/07/23.
//

import Foundation

class AddUserModel: Codable {
    let id: String?
    let name: String?
    let job: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case job
    }
    
}
