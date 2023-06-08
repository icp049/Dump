//
//  ContentView.swift
//  Dump
//
//  Created by Ian Pedeglorio on 2023-06-07.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            LoginView()
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
