//
//  RegisterView.swift
//  UserManagement
//
//  Created by Abhayjeet Singh on 18/07/23.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var registerViewModel = RegisterViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                Image("logo") // Replace "logo" with the name of your app's logo image
                
                TextField("Email", text: $registerViewModel.email)
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                SecureField("Password", text: $registerViewModel.password)
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                Button(action: {
                    // Handle login button action here
                    if registerViewModel.isInputFieldsvalidated() {
                        registerViewModel.register()
                    }
                    
                }) {
                    Text("Register")
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(8)
                        .padding(.horizontal)
                        .alert(isPresented: $registerViewModel.isAlertPresented) {
                                    Alert(
                                        title: Text("Alert"),
                                        message: Text(registerViewModel.message),
                                        dismissButton: .default(Text("OK"))
                                    )
                                }
                }.padding(.vertical)
                
            }
            .padding()
            
            // Loader view
            if registerViewModel.isLoading {
                LoaderView()
            }
        }
    }
    
    
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

