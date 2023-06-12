//
//  ShoutViewViewModel.swift
//  Dump
//
//  Created by Ian Pedeglorio on 2023-06-08.
//

import Foundation


class ShoutViewViewModel: ObservableObject{
    
    @Published var showingNewItemView = false
    
    init() {}
}



func formatDate(_ timeInterval: TimeInterval) -> String {
    let date = Date(timeIntervalSince1970: timeInterval)
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .short
    return formatter.string(from: date)
}
