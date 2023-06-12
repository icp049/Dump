import Foundation
import FirebaseAuth
import FirebaseFirestore


class NewShoutViewViewModel: ObservableObject {
    @Published var shout = ""
    @Published var shoutDate = Date()
    
    
    init() {}
    
    func save() {
        guard canSave else {
            return
        }
        
        
        //get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        
        //Create model
        let newId = UUID().uuidString
        let newItem = Shouts(id: newId,
                             shout: shout,
                             postDate: Date().timeIntervalSince1970,
                             postTime: Date().timeIntervalSince1970
        )
        
        
        
        
        //Save Model to database
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("shout")
            .document("newId")
            .setData(newItem.asDictionary())
        
        
        
    }
    
    var canSave: Bool {
        guard !shout.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        
        return true
    }
    
    
   
}
