//
//  DumpApp.swift
//  Dump
//
//  Created by Ian Pedeglorio on 2023-06-07.
//
import FirebaseCore
import SwiftUI

@main
struct DumpApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
