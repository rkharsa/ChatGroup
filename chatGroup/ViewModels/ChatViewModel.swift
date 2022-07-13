//
//  ChatViewModel.swift
//  MeetMe
//
//  Created by Rani Kharsa on 31/05/2021.
//

import Foundation
import Combine
import SwiftUI

final class ChatViewModel:ObservableObject{
    @Published var chatRepository = ChatRepository()
    @Published var  messageToSent:String=""
    private var cancellables : Set<AnyCancellable> = []
    var uuid  : String? = "";
    init() {
        self.uuid = UIDevice.current.identifierForVendor?.uuidString
    }
        
    func add(_ message:Message){
        if !message.message.isEmpty{
            chatRepository.add(message)
        }
    }
    
}
