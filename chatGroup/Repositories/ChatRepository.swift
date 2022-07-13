//
//  chat.swift
//  MeetMe
//
//  Created by Rani Kharsa on 31/05/2021.
//

import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

final class ChatRepository:ObservableObject{
    private let path = "chat"
    private let store = Firestore.firestore()
    @Published var messages:[Message]=[]
    
    init() {
        self.getChat()
    }
    
    func getChat(){

                store.collection(path).order(by: "date").addSnapshotListener { (snapshot, err) in
                    if let error = err {
                        print(error)
                        return
                    }
                    self.messages = snapshot?.documents.compactMap{
                        try? $0.data(as:Message.self)
                    } ?? []
        }
    }
    
    func add(_ message: Message){
        do{
            _ = try store.collection(path).addDocument(from: message)
        } catch{
            fatalError("Adding message failed")
        }
        
        
   
    }
    func delete(idDoc:String){
        store.collection(path).document(idDoc).delete()
    }

}
    

