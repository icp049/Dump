//
//  ContentView.swift
//  Dump
//
//  Created by Ian Pedeglorio on 2023-06-07.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel()
    
    
    var body: some View {
        NavigationView {
            if viewModel.isSignedin, !viewModel.currentUserId.isEmpty{
                TabView{
                    MainPageView()
                        .tabItem{
                            Label("Home", systemImage: "house")
                        }
                    
                    ShoutView()
                        .tabItem{
                            Label("Shouts", systemImage: "house")
                        }
                    
                    ProfileView()
                        .tabItem{
                            Label("Profile", systemImage: "person.circle")
                        }
                    
                }
            } else {
                LoginView()
            }
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
