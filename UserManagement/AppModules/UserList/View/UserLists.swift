//
//  UserLists.swift
//  UserManagement
//
//  Created by Abhayjeet Singh on 18/07/23.
//

import SwiftUI

import Kingfisher
struct UserLists: View {
    @StateObject var userListViewModel = UserListViewModel()
    @State var isPresentingAddUserView = false
    @StateObject private var addUserViewModel = AddUserViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack {
                List {
                    ForEach(userListViewModel.userLists) { item in
                        HStack(alignment: .top, spacing: 0) {
                            ZStack{
                                //item.profileImage
                                KFImage(URL(string: item.avatar))
                                    .resizable()
                                Rectangle()
                                    .foregroundColor(Color.purple.opacity(0.5))
                                
                            }.frame(width: 100, height: 80)
                            //.padding(.trailing)
                            
                            HStack (alignment: .top){
                                VStack(alignment: .leading) {
                                    Text("\(item.firstName) \(item.lastName)")
                                        .font(.system(size: 15, weight: .semibold, design: .default))
                                    Text(item.email)
                                        .font(.system(size: 15, weight: .regular, design: .default))
                                }
                                .padding(.leading)
                                .padding(.vertical, 1)
                                
                                Spacer()
                                
                                //
                                Rectangle()
                                    .frame(width: 20, height: 20)
                                    .cornerRadius(10)
                                    .foregroundColor(Color.green)
                                    .padding(.trailing, 40)
                                
                            }
                            .padding(.vertical, 20)
                            .border(width: 0.5, edges: [.top, .bottom], color: .gray)
                            .background(item.getCellColor())
                        }
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: -1, leading: 0, bottom: -1, trailing: 0))
                        .onAppear {
                            // Check if the current item is the last one
                            if item.remoteId == userListViewModel.userLists.last?.remoteId && !userListViewModel.isLoading {
                                // Make the API call to fetch more items
                                userListViewModel.loadData()
                            }
                        }
                    }
                    
                }
                
                .padding(.horizontal, -40)
                .padding(.top, -30)
                
                
                .onAppear {
                    userListViewModel.loadData()
                }
                
                if userListViewModel.isLoading {
                    ProgressView()
                }
            }
            
            
            Button {
                isPresentingAddUserView = true
            } label: {
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                    .background(Color("appThemeGreen"))
                    .clipShape(Circle())
                    
            }
            .sheet(isPresented: $isPresentingAddUserView) {
                AddUserView(addUserViewModel: addUserViewModel, isPresented: $isPresentingAddUserView)
            }
            .padding()
            
        }
        
        .navigationBarColor(backgroundColor: Color("appThemeGreen"), titleColor: .white)
        .navigationBarTitleDisplayMode(.inline)
        
        .navigationBarTitle("CONTACTS")
        .navigationBarItems(leading:
                                Image("hambergerMenu")
            .resizable()
            .frame(width: 30, height: 30)
                            
        )
        .navigationBarBackButtonHidden(true)
        
    }
}

struct UserLists_Previews: PreviewProvider {
    static var previews: some View {
        UserLists()
    }
}



struct EdgeBorder: Shape {
    var width: CGFloat
    var edges: [Edge]
    
    func path(in rect: CGRect) -> Path {
        edges.map { edge -> Path in
            switch edge {
            case .top: return Path(.init(x: rect.minX, y: rect.minY, width: rect.width, height: width))
            case .bottom: return Path(.init(x: rect.minX, y: rect.maxY - width, width: rect.width, height: width))
            case .leading: return Path(.init(x: rect.minX, y: rect.minY, width: width, height: rect.height))
            case .trailing: return Path(.init(x: rect.maxX - width, y: rect.minY, width: width, height: rect.height))
            }
        }.reduce(into: Path()) { $0.addPath($1) }
    }
}
