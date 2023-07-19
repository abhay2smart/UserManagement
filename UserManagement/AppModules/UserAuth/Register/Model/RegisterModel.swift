//
//  RegisterModel.swift
//  UserManagement
//
//  Created by Abhayjeet Singh on 18/07/23.
//

import Foundation

struct RegisterModel: Codable {
    var id:Int?
    var token: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case token
    }
    
}
