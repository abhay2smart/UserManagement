//
//  LoginViewModel.swift
//  UserManagement
//
//  Created by Abhayjeet Singh on 18/07/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email: String = "eve.holt@reqres.in"
    @Published var password: String = "cityslicka"
    
    @Published var message = ""
    @Published var isAlertPresented = false
    
    @Published var isLoading = false
    
    @Published var isLoggedIn = false
    
    
    
    func isInputFieldsvalidated()->Bool {
        if email.isEmpty {
            message = "Please enter email"
            isAlertPresented = true
            return false
        }
        
        if email.isEmpty {
            message = "Please enter email"
            isAlertPresented = true
            return false
        }
        
        if !email.isEmail {
            message = "Please enter a valid email"
            isAlertPresented = true
            return false
        }
        
        if password.isEmpty {
            message = "Please enter password"
            isAlertPresented = true
            return false
        }
        
        return true
    }
    
    
    
    
    func login() {
        if isLoading {
            return
        }
        
        isLoading = true
        
        
        let url = Constant.baseUrl + Constant.EndPoints.login
        print("url-> \(url)")
        
        var param = [String: Any]()
        
        param["email"] = email
        param["password"] = password
        APIService.shared.makeApiTypeRequest(url: url, param: param, methodType: .post, expecting: LoginModel.self) { [weak self] data, error in
            DispatchQueue.main.async {
                self?.isLoading = false
            }
            
            if error != nil {
                DispatchQueue.main.async {
                    self?.message = error ?? "Something went wrong"
                    self?.isAlertPresented = true
                }
                
                return
            }
            
            
            guard let remoteData = data else {
                self?.isLoading = false
                self?.message = "Something went wrong"
                self?.isAlertPresented = true
                print("No Data")
                return
            }
            
            DispatchQueue.main.async {
                self?.isLoading = false
                print("remoteData.token \(remoteData.token)")
                if remoteData.token != "" {
                    self?.isLoggedIn = true
                }
            }
            
        }
        
    }
}

