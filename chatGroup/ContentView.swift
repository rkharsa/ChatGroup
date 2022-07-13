//
//  ContentView.swift
//  chatGroup
//
//  Created by Rani Kharsa on 26/01/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ChatView(chatViewModel: ChatViewModel())
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()

    let standard = UINavigationBarAppearance()
        standard.backgroundColor = UIColor(named: "bg") //When you scroll or you have title (small one)
        standard.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "Avenir", size: 20)!]
        navigationBar.tintColor = UIColor.white
       


    navigationBar.standardAppearance = standard

 }
}

