//
//  ChatItemView.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 28/11/2020.
//

import SwiftUI

struct ChatItemView: View {
    //MARK: PROPERTIES
    var chatItem = ChatItem()
    
    //MARK: BODY
    var body: some View {
        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10) {
            
            Image("Background")
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(80)
                .imageScale(.large)
                .clipped()
            
            VStack(alignment: .leading, spacing: 5){
                
                Spacer()
                
                HStack{
                    Text("\(chatItem.lastName) \(chatItem.firstName)")
                        .font(Font.robotoRegular(size: 16))
                    
                    Spacer()
                    
                    Text("\(chatItem.lastDate.getFormattedDate(format: "MMM dd, HH:mm"))")
                        .font(Font.robotoThin(size: 12))
                        
                }
              
                Text("\(chatItem.lastMessage)")
                    .font(Font.robotoThin(size: 14))
          
                Spacer()
                    
             }
            //: VSTACK
            
            Spacer()
        }
        //: HSTACK
        .padding(8)
        .background(Color.clear)
    }
}

struct ChatItemView_Previews: PreviewProvider {
    static var previews: some View {
        ChatItemView()
    }
}
