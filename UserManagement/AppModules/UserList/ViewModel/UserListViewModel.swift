//
//  UserListViewModel.swift
//  UserManagement
//
//  Created by Abhayjeet Singh on 18/07/23.
//

import Foundation

class UserListViewModel: ObservableObject {
    @Published var userLists:[UserData] = [UserData]()
    @Published var isLoading = false
    @Published var errMsg = ""
    
    @Published var addButtonTapped = false
    private var page = 1
    
    func loadData() {
        if isLoading {
            return
        }
        
        isLoading = true
        
        
        let url = "https://reqres.in/api/users?page=\(page)"
        print("url-> \(url)")
        
        APIService.shared.makeApiTypeRequest(url: url, methodType: .get, expecting: UserListModel.self) { [weak self] data, error in
            DispatchQueue.main.async {
                self?.isLoading = false
            }
            
            if error != nil {
                return
            }
            
            
            guard let remoteData = data else {
                //self?.isLoading = false
                self?.errMsg = "Something went wrong"
                print("No Data")
                return
            }
            
            print("remoteData \(remoteData.data.first?.firstName)")
            
            DispatchQueue.main.async {
                if remoteData.data.count > 0 {
                    for item in remoteData.data {
                        self?.userLists.append(item)
                    }
                    self?.page = (self?.page ?? 0) + 1
                }
                
                //self?.isLoading = false
            }
            
        }
        
    }
}
