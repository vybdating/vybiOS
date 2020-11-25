//
//  ChatMessageController.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 24/11/2020.
//

import SwiftUI

struct ChatMessageController: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, World! Chat")
                    
            }
            //: VSTACK
            .background(Color.vybBackground)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .padding([.leading,.trailing],8)
            .padding([.top,],10)
            .navigationTitle(Text("Dates"))
            .navigationBarTitle(Text("Dates"), displayMode: .inline)
        }
        //: NAVIGATION VIEW
        .onAppear(){
            UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
           // UINavigationBar.appearance().shadowImage = UIImage()
        }
    }
}

struct ChatMessageController_Previews: PreviewProvider {
    static var previews: some View {
        ChatMessageController()
    }
}
