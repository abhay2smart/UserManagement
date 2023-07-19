//
//  UserManagementApp.swift
//  UserManagement
//
//  Created by Abhayjeet Singh on 18/07/23.
//

import SwiftUI

@main
struct UserManagementApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(ToastManager())
        }
    }
}
