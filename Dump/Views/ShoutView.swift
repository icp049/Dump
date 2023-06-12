import SwiftUI

struct ShoutView: View {
    @StateObject var viewModel = ShoutViewViewModel()
    @State private var isShowingNewShoutView = false
    
    var body: some View {
        NavigationView {
            VStack {
                // Your view content here
                
            }
            .navigationBarTitle("Shout")
            .navigationBarItems(trailing:
                Button(action: {
                    isShowingNewShoutView = true
                }) {
                    Image(systemName: "plus")
                }
            )
            .sheet(isPresented: $isShowingNewShoutView) {
                NewShoutView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}



struct ShoutView_Previews: PreviewProvider {
    static var previews: some View {
        ShoutView()
    }
}

