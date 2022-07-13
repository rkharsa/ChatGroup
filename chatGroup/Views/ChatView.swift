import SwiftUI



struct ChatView: View {
    
    @StateObject var chatViewModel : ChatViewModel
    
    var body: some View {
        VStack {
            HStack{
                ChatList(chatListViewModel:ChatListViewModel())
            }
            
            HStack{
                ZStack {
                    TextEditor(text:$chatViewModel.messageToSent)
                    RoundedRectangle(cornerRadius: 10)
                        .stroke()
                        .foregroundColor(.gray)
                }.frame(height: 50)
                Button(action:{
                    
                    let _message = Message(date: Date(),message: chatViewModel.messageToSent,
                                           fromIdDevice:chatViewModel.uuid ?? " ")
                    chatViewModel.add(_message)
                    chatViewModel.messageToSent=" "
                }){
                    Image(systemName: "paperplane.circle.fill" ).font(.system(size: 50))
                }}.resignKeyboardOnDragGesture()
            
        }.padding().navigationBarTitleDisplayMode(.inline).toolbar { // <2>
            ToolbarItem(placement: .principal) { // <3>
                ZStack{
                    HStack{
                        VStack{
                            Text("Groupe").font(Font.custom("Avenir", size: 20)).foregroundColor(.white)
                        }
                        
                    }
                    
                    
                }
            }
        }
        }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
    
}



extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged { _ in
        UIApplication.shared.endEditing()
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ChatView(chatViewModel: ChatViewModel())
        }
    }
}

