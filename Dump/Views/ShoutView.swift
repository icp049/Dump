import SwiftUI
import FirebaseFirestoreSwift

struct ShoutView: View {
    @StateObject var viewModel = ShoutViewViewModel()
    @FirestoreQuery var items: [Shouts]
    
    
    
    
    init(userId: String){
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/shout")
    }
    
    
    
    var body: some View {
        NavigationView {
            VStack {
                // Your view content here
                
                List(items) {
                    item in Text(item.shout)
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
