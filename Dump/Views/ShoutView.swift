import SwiftUI
import FirebaseFirestoreSwift

struct ShoutView: View {
    @StateObject var viewModel = ShoutViewViewModel()
    @FirestoreQuery var shouts: [Shouts]
    @FirestoreQuery var rants: [Rants]
    
    
    
    init(userId: String){
        self._shouts = FirestoreQuery(collectionPath: "users/\(userId)/shout")
        self._rants = FirestoreQuery(collectionPath: "users/\(userId)/rant")
    }
    
    
    
    var body: some View {
        NavigationView {
            VStack {
                // Your view content here
                
                List(shouts.sorted { $0.postDate > $1.postDate }) { item in
                    VStack(alignment: .leading) {
                        Text(item.shout)
                            .font(.headline)
                        Text(formatDate(item.postDate))
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .listStyle(PlainListStyle())
                
                List(rants.sorted { $0.postDate > $1.postDate }) { item in
                    VStack(alignment: .leading) {
                        Text(item.rant)
                            .font(.headline)
                        Text(formatDate(item.postDate))
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .listStyle(PlainListStyle())            }
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
