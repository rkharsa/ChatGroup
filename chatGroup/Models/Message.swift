//
//  Message.swift
//  chatGroup
//
//  Created by Rani Kharsa on 26/01/2022.
//

import FirebaseFirestoreSwift
import UIKit

struct Message:Identifiable,Codable,Equatable{
    @DocumentID var id : String?
    var date : Date
    var message:String
    var fromIdDevice : String
}
