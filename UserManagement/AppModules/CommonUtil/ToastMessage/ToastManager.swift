//
//  ToastManager.swift
//  UserManagement
//
//  Created by Abhayjeet Singh on 19/07/23.
//

import SwiftUI

import SwiftUI

class ToastManager: ObservableObject {
    @Published var showToast = false
    @Published var toastMessage = ""
    
    func showToast(message: String) {
        DispatchQueue.main.async { [weak self] in
            self?.toastMessage = message
            self?.showToast = true
        }
        
        
        // Automatically hide the toast after a delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            self?.showToast = false
        }
    }
}
