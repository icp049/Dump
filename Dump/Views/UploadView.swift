//
//  UploadView.swift
//  Dump
//
//  Created by Ian Pedeglorio on 2023-06-11.
//

import SwiftUI

struct UploadView: View {
    
    @Binding var newItemPresented: Bool
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView(newItemPresented: Binding(get: {
            return true
        }, set: { _ in
        }))    }
}
