//
//  AddUserViewModel.swift
//  UserManagement
//
//  Created by Abhayjeet Singh on 19/07/23.
//

import Foundation
class AddUserViewModel: ObservableObject {
    @Published var isLoading = false
    
    @Published var name = ""
    @Published var jobType = ""
    @Published var message = ""
    
    @Published var shouldAlertShow = false

    func isFieldsValidated()-> Bool {
        if name.isEmpty {
            message = "Please enter name"
            shouldAlertShow = true
            return false
        }
        
        if jobType.isEmpty {
            message = "Please enter job type"
            shouldAlertShow = true
            return false
        }
        
        return true
    }
    
    func saveData(completion: @escaping () -> Void) {
        self.isLoading = true
        // Perform API call and data saving logic here
        
        let url = "https://reqres.in/api/users"
        print("url-> \(url)")
        
        var param = [String: Any]()
        
        param["name"] = name
        param["job"] = jobType
        APIService.shared.makeApiTypeRequest(url: url, param: param, methodType: .post, expecting: AddUserModel.self) { [weak self] data, error in
            DispatchQueue.main.async {
                self?.isLoading = false
            }
            
            if error != nil {
                completion()
                return
            }
            completion()
        }
    }
    
    func resetVars() {
        name = ""
        jobType = ""
        message = ""
    }
}
