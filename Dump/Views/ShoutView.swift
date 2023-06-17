import SwiftUI
import FirebaseFirestoreSwift

struct Shout: Codable, Identifiable {
    let id: String
    let shout: String
    let postDate: TimeInterval
    let postTime: TimeInterval
    
}

struct Rant: Codable, Identifiable {
    let id: String
    let rant: String
    let postDate: TimeInterval
    let postTime: TimeInterval
    
}

struct PostWrapper: Identifiable {
    let id: String
    let content: String
    let postDate: TimeInterval
    
}


struct ShoutView: View {
    @StateObject var viewModel = ShoutViewViewModel()
    @FirestoreQuery var shouts: [Shouts]
    @FirestoreQuery var rants: [Rants]
    
    var combinedList: [PostWrapper] {
            let shoutPosts = shouts.map { PostWrapper(id: $0.id, content: $0.shout, postDate: $0.postDate) }
            let rantPosts = rants.map { PostWrapper(id: $0.id, content: $0.rant, postDate: $0.postDate) }
            return (shoutPosts + rantPosts).sorted { $0.postDate > $1.postDate }
        }
   
    
    
    init(userId: String){
        self._shouts = FirestoreQuery(collectionPath: "users/\(userId)/shout")
        self._rants = FirestoreQuery(collectionPath: "users/\(userId)/rant")
    }
    
    
    
    var body: some View {
        NavigationView {
            VStack {
                // Your view content here
                
                List(combinedList) { item in
                    VStack(alignment: .leading) {
                        Text(item.content)
                            .font(.headline)
                        
                             
                        Text(formatDate(item.postDate))
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .listStyle(PlainListStyle())
                
        
                       }
            .navigationBarTitle("Shout")
            .toolbar{
                
                Button{
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
                
                .sheet(isPresented: $viewModel.showingNewItemView) {
                    NewShoutView(newItemPresented: $viewModel.showingNewItemView)
                }
            }
        }
    }
    
    
    
    struct ShoutView_Previews: PreviewProvider {
        static var previews: some View {
            ShoutView(userId: "KW4SJkka8ES6n6Ju99zgw1FD3u33")
        }
    }
    
}
