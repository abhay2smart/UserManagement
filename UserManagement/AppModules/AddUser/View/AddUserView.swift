//
//  AddUserView.swift
//  UserManagement
//
//  Created by Abhayjeet Singh on 19/07/23.
//

import SwiftUI

struct AddUserView: View {
    @ObservedObject var addUserViewModel: AddUserViewModel
    @EnvironmentObject  var toastManager: ToastManager
    @Binding var isPresented: Bool
    
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
                
            VStack {
                TextField("Name", text: $addUserViewModel.name)
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                TextField("Job type", text: $addUserViewModel.jobType)
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                HStack(spacing: 30) {
                    Spacer()
                    Button {
                        isPresented = false
                    } label: {
                        Text("Cancel")
                    }
                    Button {
                        if addUserViewModel.isFieldsValidated() {
                            addUserViewModel.saveData {
                                DispatchQueue.main.async {
                                    self.toastManager.showToast = true
                                    self.toastManager.showToast(message: "User created successfully!")
                                }
                                isPresented = false
                            }
                        }
                        
                    } label: {
                        Text("Add")
                    }
                    .alert(isPresented: $addUserViewModel.shouldAlertShow) {
                        Alert(
                            title: Text("Alert"),
                            message: Text(addUserViewModel.message),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                    
                }
                .padding(.trailing)
                .padding(.top, 15)
            }
            
            .frame(width: 300, height: 150)
            .padding(.vertical)
            .background(
                Rectangle()
                    .fill(.white)
                    .cornerRadius(12)
                    .shadow(
                        color: Color.gray.opacity(0.7),
                        radius: 8,
                        x: 0, y: 0)
            )
            
            if addUserViewModel.isLoading {
                LoaderView()
            }
            
            
        }.onAppear {
            addUserViewModel.resetVars()
        }
    }
}

