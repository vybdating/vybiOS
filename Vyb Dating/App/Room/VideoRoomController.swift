//
//  VideoRoomController.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 24/11/2020.
//

import SwiftUI

struct VideoRoomController: View {
    //MARK: PROPERTIES
    @ObservedObject var viewModel = RoomViewModel()
   
    init() {
           UITableView.appearance().tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: Double.leastNonzeroMagnitude))
          
         //  UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
       }
    
    //MARK: BODY
    var body: some View {
        NavigationView {
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0) {
                   
                    List(viewModel.roomList, id: \.id) { item in
                        RoomItemView(roomItem: item)
                    }
                    //: LIST
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .lineSpacing(8.0)
                    .padding(.leading, -16)
                    .padding(.trailing, -16)
                  
                    RoomBottomActionView()
                    //: ROOM ACTION
            }
            //: VSTACK
            .background(Color.vybBackground)
            .navigationTitle(Text("Room"))
            .navigationBarTitle(Text("Room"), displayMode: .inline)
            .navigationBarItems(trailing:
                        Button(action: {
                           print("Sahring action")
                        }) {
                            Image(systemName: "person.crop.circle.badge.plus")
                                .foregroundColor(Color.primaryVybe)
                                .font(.system(size: 24, weight: .semibold, design: .rounded))
                        }
                )
            
        }
        //: NAVIGATION VIEW
    }
}

struct VideoRoomController_Previews: PreviewProvider {
    static var previews: some View {
        VideoRoomController()
    }
}
