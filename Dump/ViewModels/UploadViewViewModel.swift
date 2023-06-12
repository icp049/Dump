//
//  UploadViewViewModel.swift
//  Dump
//
//  Created by Ian Pedeglorio on 2023-06-12.
//

import Foundation
import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage

class UploadPhotoViewModel: ObservableObject {
    @Published var photo: UIImage?
    @Published var uploadProgress: Double = 0.0
    
    init() {}
    
    func uploadPhoto() {
        guard let photo = photo else {
            return
        }
        
        // Get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Generate a unique filename for the photo
        let filename = UUID().uuidString + ".jpg"
        
        // Reference to the storage location
        let storageRef = Storage.storage().reference().child("users/\(uId)/photos/\(filename)")
        
        // Convert the photo to data
        guard let imageData = photo.jpegData(compressionQuality: 0.8) else {
            return
        }
        
        // Create metadata for the photo
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        // Create a storage upload task
        let uploadTask = storageRef.putData(imageData, metadata: metadata)
        
        // Observe the upload progress
        uploadTask.observe(.progress) { snapshot in
            guard let progress = snapshot.progress else { return }
            self.uploadProgress = Double(progress.completedUnitCount) / Double(progress.totalUnitCount)
        }
        
        // Handle the completion of the upload task
        uploadTask.observe(.success) { snapshot in
            // Photo uploaded successfully
            // You can perform any additional tasks here, such as saving the photo URL to the database
            
            // Reset the upload progress
            self.uploadProgress = 0.0
        }
        
        uploadTask.observe(.failure) { snapshot in
            // Error occurred during the upload
            let error = snapshot.error
            // Handle the error as needed
        }
    }
    
    var canUpload: Bool {
        return photo != nil
    }
}
