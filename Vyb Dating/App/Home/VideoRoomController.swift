//
//  VideoRoomController.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 24/11/2020.
//

import SwiftUI

struct VideoRoomController: View {
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, World! Video")
                    
            }
            //: VSTACK
            .background(Color.vybBackground)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .padding([.leading,.trailing],8)
            .padding([.top,],10)
            .navigationTitle(Text("Room").font(Font.robotoThin(size: 16)))
            .navigationBarTitle(Text("Room").font(Font.robotoThin(size: 16)), displayMode: .inline)
            
        }
        //: NAVIGATION VIEW
        .onAppear(){
            UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
            //UINavigationBar.appearance().shadowImage = UIImage()
        }
    }
}

struct VideoRoomController_Previews: PreviewProvider {
    static var previews: some View {
        VideoRoomController()
    }
}
