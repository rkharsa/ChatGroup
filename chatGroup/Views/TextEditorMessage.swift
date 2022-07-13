//
//  TextEditorMessage.swift
//  MeetMe
//
//  Created by Rani Kharsa on 14/06/2021.
//

import SwiftUI

struct TextEditorMessage: View {
    @Binding var messageToSent:String
    var body: some View {
        ZStack {
            TextEditor(text : $messageToSent)
            RoundedRectangle(cornerRadius: 10)
                .stroke()
                .foregroundColor(.gray)
        }.frame(height: 50)
    }
}

