//
//  UserListModel.swift
//  UserManagement
//
//  Created by Abhayjeet Singh on 18/07/23.
//

import Foundation
import SwiftUI


// MARK: - Welcome
struct UserListModel: Codable {
    let page, perPage, total, totalPages: Int
    let data: [UserData]
    let support: Support

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data, support
    }
}

// MARK: - Datum
struct UserData: Codable, Identifiable {
    var id:UUID = UUID()
    let remoteId: Int
    let email, firstName, lastName: String
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case remoteId = "id"
        case email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
    
    func getCellColor()-> Color {
        if remoteId % 2 == 0 {
            return Color("evenCellColor")
        } else {
            return .white
        }
    }
}

// MARK: - Support
struct Support: Codable {
    let url: String
    let text: String
}
