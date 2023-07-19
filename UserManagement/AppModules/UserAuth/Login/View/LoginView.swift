//
//  LoginView.swift
//  UserManagement
//
//  Created by Abhayjeet Singh on 18/07/23.
//


import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @StateObject var loginViewModel = LoginViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                Image("logo") // Replace "logo" with the name of your app's logo image
                
                TextField("Email", text: $loginViewModel.email)
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                SecureField("Password", text: $loginViewModel.password)
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                Button(action: {
                    // Handle login button action here
                    if loginViewModel.isInputFieldsvalidated() {
                        loginViewModel.login()
                    }
                    
                    
                }) {
                    Text("Login")
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(8)
                        .padding(.horizontal)
                }.padding(.vertical)
                
                .alert(isPresented: $loginViewModel.isAlertPresented) {
                            Alert(
                                title: Text("Alert"),
                                message: Text(loginViewModel.message),
                                dismissButton: .default(Text("OK"))
                            )
                        }
                
                NavigationLink(destination: RegisterView(), label: {
                    Text("Register here")
                        .padding(.bottom, -10)
                })
                
                NavigationLink(destination: UserLists(), isActive: $loginViewModel.isLoggedIn) {
                    EmptyView()
                }
                
            }
            .padding()
            
            // Loader view
            if loginViewModel.isLoading {
                LoaderView()
            }
        }
    }
    
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
