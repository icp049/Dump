//
//  ProfileView.swift
//  Dump
//
//  Created by Ian Pedeglorio on 2023-06-08.
//

import SwiftUI



struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        NavigationView{
            VStack{
                // Avatar
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color.blue)
                    .frame(width: 125, height: 125)
                   
                
                
                //all the info
                VStack(alignment: .leading){
                    HStack{
                        Text("Name")
                        Text("Ian Pedeglorio")
                        
                    }
                    HStack{
                        Text("Email")
                        Text("icp049@gmail.com")
                    }
                    
                }
                
                
                
                //sign out button
                Button{
                    //action for signout
                    
                    viewModel.logOut()
                    
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.yellow)
                        
                        Text("Sign Out")
                            .foregroundColor(Color.white)
                            .bold()
                    }
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
