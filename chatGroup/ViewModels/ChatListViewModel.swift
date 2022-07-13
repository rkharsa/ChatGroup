//
//  ChatListViewModel.swift
//  MeetMe
//
//  Created by Rani Kharsa on 15/06/2021.
//

import SwiftUI
import Foundation
import Combine

final class ChatListViewModel:ObservableObject{
    @Published var chatRepository = ChatRepository()
    @Published var messages : [Message]=[]
    @Published var uuid  : String? = " ";
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
