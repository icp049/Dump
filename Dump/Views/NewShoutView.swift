import SwiftUI

struct NewShoutView: View {
    @StateObject var viewModel = NewShoutViewViewModel()
    @Binding var newItemPresented: Bool
    
    
    
    var body : some View {
        VStack{
            Text("New Shout")
                .font(.system(size:32))
                .bold()
                .padding(.top, 100)
            
            Form {
                //shout
                TextField("What's your shout?", text: $viewModel.shout)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                
                RUButton(title: "Add", background: .pink)
                {
                    viewModel.save()
                    newItemPresented = false
                }
            }
        }
    }
}


struct NewShoutView_Previews: PreviewProvider{
    static var previews: some View{
        NewShoutView(newItemPresented: Binding(get: {
            return true
        }, set: { _ in
        }))
    }
    
}
