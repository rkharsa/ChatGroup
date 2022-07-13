//
//  ChatList.swift
//  MeetMe
//
//  Created by Rani Kharsa on 13/06/2021.
//

import SwiftUI

struct ChatList: View {
    @StateObject var  chatListViewModel : ChatListViewModel
    func isSender(fromIdDevice:String)-> Bool{
        return chatListViewModel.uuid == fromIdDevice
    }
    var body: some View {
        ScrollView{
            ScrollViewReader { value in
                
                LazyVStack {
                    ForEach(chatListViewModel.messages){ message  in
                        HStack{
                            let position = !isSender(fromIdDevice: message.fromIdDevice) ? BubblePosition.left :  BubblePosition.right
                            let color : Color = !isSender(fromIdDevice: message.fromIdDevice) ? Color("bg") : .green
                            let remove  = !isSender(fromIdDevice: message.fromIdDevice) ? false :  true
                       
                            HStack(spacing: 0 ) {
                                if(remove == true){
                                    Button(action:{
                                        chatListViewModel.removeMessage(idDoc: message.id ?? " ")
                                    }){
                                        Image(systemName: "xmark" ).font(.system(size: 20)).foregroundColor(Color.red)
                                    }
                                }
                                Text(message.message)
                                    .padding(.all, 15)
                                    .foregroundColor(Color.white)
                                    .background(color)
                                    .clipShape(RoundedRectangle(cornerRadius: 18))
                                    .overlay(
                                        Image(systemName: "arrowtriangle.left.fill")
                                            .foregroundColor(color)
                                            .rotationEffect(Angle(degrees: position == .left ? -50 : -130))
                                            .offset(x: position == .left ? -5 : 5)
                                        ,alignment: position == .left ? .bottomLeading : .bottomTrailing)
                                
                            
                              
                            }
                            .padding(position == .left ? .leading : .trailing , 15)
                            .padding(position == .right ? .leading : .trailing , 60)
                            .frame(width: UIScreen.main.bounds.width, alignment: position == .left ? .leading : .trailing)
                            
                        }.id(message.id)
                    }
                    
                }.onChange(of: chatListViewModel.messages, perform: { _ in
                    value.scrollTo(chatListViewModel.messages.last?.id)
                    
                }).onAppear{
                    value.scrollTo(chatListViewModel.messages.last?.id)
                }.padding(.top).resignKeyboardOnDragGesture()
            }
        }
        
        
        
        
    }
}

