//
//  ToastView.swift
//  UserManagement
//
//  Created by Abhayjeet Singh on 19/07/23.
//

import SwiftUI

struct ToastView: View {
    let message: String
    
    var body: some View {
        Text(message)
            .foregroundColor(.white)
            .padding(10)
            .background(Color.black.opacity(0.7))
            .cornerRadius(10)
            .padding(.horizontal, 20)
    }
}
struct ToastView_Previews: PreviewProvider {
    static var previews: some View {
        ToastView(message: "Hi")
    }
}
