//
//  chatGroupApp.swift
//  chatGroup
//
//  Created by Rani Kharsa on 26/01/2022.
//

import SwiftUI
import Firebase
@main
struct chatGroupApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
