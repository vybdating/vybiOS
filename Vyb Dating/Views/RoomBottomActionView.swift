//
//  RoomBottomActionView.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 25/11/2020.
//

import SwiftUI

struct RoomBottomActionView: View {
    
    //MARK: Properties
    @State var selection: NavigationPushedAction? = nil
    
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0){
            
            Rectangle()
                .background(Color.gray)
                .frame(height: 0.2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipped()
            
            Text("+3 Professionals are in this rom")
                .font(Font.robotoThin(size: 16))
                .multilineTextAlignment(.center)
                .padding(8)
            //: TEXT
            
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 8){
                NavigationLink(destination: EmptyView(), tag: NavigationPushedAction.phoneNumberAction, selection: $selection) {
                    DefaultButton(title: "Enter Room", action:{
                        self.selection = NavigationPushedAction.phoneNumberAction
                    }).clipped()
                }
                
                NavigationLink(destination: EmptyView(), tag: NavigationPushedAction.phoneNumberAction, selection: $selection) {
                    DefaultButton(title: "Next Room", disabled: true ,action:{
                        self.selection = NavigationPushedAction.phoneNumberAction
                    }).clipped()
                }
            }.padding(8)
            //: HSTACK
        }
        .padding(0)
        //: VSTACK
    }
}

struct RoomBottomActionView_Previews: PreviewProvider {
    static var previews: some View {
        RoomBottomActionView().previewLayout(.sizeThatFits)
    }
}
