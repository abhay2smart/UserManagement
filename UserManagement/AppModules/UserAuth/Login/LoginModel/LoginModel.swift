//
//  LoginModel.swift
//  UserManagement
//
//  Created by Abhayjeet Singh on 18/07/23.
//

import Foundation

// MARK: - Welcome
struct LoginModel: Codable {
    let token: String
    enum CodingKeys: String, CodingKey {
        case token
    }
}

