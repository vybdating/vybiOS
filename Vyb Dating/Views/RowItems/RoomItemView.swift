//
//  RoomItemView.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 25/11/2020.
//

import SwiftUI

struct RoomItemView: View {
    //MARK: PROPERTIES
    var roomItem = RoomItem()
    
    //MARK: BODY
    var body: some View {
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10) {
                Image("Background")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .cornerRadius(100)
                    .imageScale(.large)
                    .clipped()
                
                VStack(alignment: .leading, spacing: 5){
                    
                    Spacer()
                    
                    Text("\(roomItem.name)")
                        .font(Font.robotoThin(size: 16))
                    
                    Text("\(roomItem.height)")
                        .font(Font.robotoThin(size: 16))
                    
                    Text("\(roomItem.profession)")
                        .font(Font.robotoThin(size: 16))
                    
                    Text("\(roomItem.location)")
                        .font(Font.robotoThin(size: 16))
                    
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

struct RoomItemView_Previews: PreviewProvider {
    static var previews: some View {
        
        RoomItemView(roomItem: RoomItem(id: "2", name: "Bright Ahedor", height: "4'5''", profession: "Lectuerer", imageName: "Background", location: "NY")).previewLayout(.sizeThatFits)
    }
}
