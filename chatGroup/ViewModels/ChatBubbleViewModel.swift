//
//  ChatBubble.swift
//  chatGroup
//
//  Created by Rani Kharsa on 29/01/2022.
//

import SwiftUI
import Foundation
import Combine

final class ChatBubbleViewModel:ObservableObject{
    @Published var chatRepository = ChatRepository()
    @Published var messages : [Message]=[]
    var uuid  : String? = "";
    var messageToSent:String=""
    private var cancellables : Set<AnyCancellable> = []
    
    init() {
        self.uuid = UIDevice.current.identifierForVendor?.uuidString
        chatRepository.$messages.assign(to: \.messages,on: self).store(in: &cancellables)
    }
    
    func removeMessage(idDoc : String){
        chatRepository.delete(idDoc:idDoc )
    }
    
}
