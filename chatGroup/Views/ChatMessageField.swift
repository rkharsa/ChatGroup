//
//  ChatMessageField.swift
//  MeetMe
//
//  Created by Rani Kharsa on 13/06/2021.
//

import SwiftUI

struct ChatMessageField: View {
    @Binding var messageToSent: String
    var body: some View {
        ZStack {
            TextEditor(text:$messageToSent)
            RoundedRectangle(cornerRadius: 10)
                .stroke()
                .foregroundColor(.gray)
        }.frame(height: 50)
        Button(action:{

            let _message = Message(date: Date(), message: chatViewModel.messageToSent, fromIdDevice: "")
           
            chatViewModel.add(_message)
            chatViewModel.messageToSent=""
        }){
            Image(systemName: "paperplane.circle.fill" ).font(.system(size: 50))
        }.resignKeyboardOnDragGesture()

    }
}

