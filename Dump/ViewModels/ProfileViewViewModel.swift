//
//  ProfileViewViewModel.swift
//  Dump
//
//  Created by Ian Pedeglorio on 2023-06-08.
//

import Foundation
import FirebaseAuth


class ProfileViewViewModel: ObservableObject{
    
    init() {}
    
    
    
    
    
    func logOut(){
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
    
    
}
