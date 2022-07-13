//
//  ChatBubble.swift
//  MeetMe
//
//  Created by Rani Kharsa on 31/05/2021.
//

import Foundation
import SwiftUI
struct ChatBubble<Content>: View where Content: View {
    @StateObject var  chatBubbleViewModel : ChatBubbleViewModel = ChatBubbleViewModel()
    let position: BubblePosition
    let color : Color
    let remove : Bool
    let content: () -> Content
    let idMessage : String
    init(position: BubblePosition, color: Color,idMessage : String,remove: Bool ,@ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.color = color
        self.position = position
        self.remove=remove
        self.idMessage=idMessage
    }
    
    var body: some View {
        HStack(spacing: 0 ) {
            if(remove==true){
                Button(action:{
                    chatBubbleViewModel.removeMessage(idDoc: idMessage)
                }){
                    Image(systemName: "xmark" ).font(.system(size: 20)).foregroundColor(Color.red)
                }
            }
            content()
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
        .frame(width: UIScreen.main.bounds.width, alignment: position == .left ? .leading : .trailing).animation(.easeInOut)
    }
}
