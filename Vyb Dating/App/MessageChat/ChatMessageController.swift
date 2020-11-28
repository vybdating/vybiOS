//
//  ChatMessageController.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 24/11/2020.
//

import SwiftUI

struct ChatMessageController: View {
    
    //MARK: PROPERTIES
    @ObservedObject var viewModel = ChatMessageViewModel()
   
    init() {
           UITableView.appearance().tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: Double.leastNonzeroMagnitude))
          
          // UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
       }
    
    //MARK: BODY
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.chats, id: \.id) { item in
                    ChatItemView(chatItem: item)
                        .modifier(RowModifier())
                        .animation(.linear(duration: 0.3))
                }
                //: LIST
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .lineSpacing(8.0)
                .padding(.leading, -16)
                .padding(.trailing, -16)
                    
            }
            //: VSTACK
            .background(Color.vybBackground)
            .navigationTitle(Text("My Dates"))
            .navigationBarTitle(Text("My Dates"), displayMode: .inline)
        }
        //: NAVIGATION VIEW
    }
}

struct ChatMessageController_Previews: PreviewProvider {
    static var previews: some View {
        ChatMessageController()
    }
}
