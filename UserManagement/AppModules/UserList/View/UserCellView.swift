//
//  UserCellView.swift
//  UserManagement
//
//  Created by Abhayjeet Singh on 18/07/23.
//

import SwiftUI

struct UserCellView: View {
    var body: some View {
        ZStack {
            HStack {
                ZStack{
                    Image(systemName: "house")
                        .resizable()
                    Rectangle()
                    .foregroundColor(Color.blue.opacity(0.5))
                    
                }.frame(width: 100, height: 100)
                    .padding(.trailing)
                
                HStack {
                    VStack {
                        Text("Adam Aka")
                        Text("Apple Inc")
                    }
                    Spacer()
                    
                    Image(systemName: "house")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(.trailing)
                    
                    
                }
                
            }
        }
    }
}

struct UserCellView_Previews: PreviewProvider {
    static var previews: some View {
        UserCellView()
    }
}
