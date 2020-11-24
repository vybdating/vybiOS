//
//  HomeTabController.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 24/11/2020.
//

import SwiftUI

struct HomeTabController: View {
    //MARK: PROPERTIES
    @State private var selectedTab = 1
    
    
    //MARK: BODY
    var body: some View {
        TabView(selection: $selectedTab) {
            ChatMessageController()
                .onTapGesture {
                    self.selectedTab = 0
                }
                .tabItem {
                    Image(systemName: "list.dash")
                        .resizable()
                        .font(Font.robotoRegular(size: 16))
                        .clipped()
                        .scaledToFit()
                        .imageScale(.medium)
                }
                .tag(0)
            //: TAB CHATS
            VideoRoomController()
                .onTapGesture {
                    self.selectedTab = 1
                }
                .tabItem {
                    Image(systemName: "video.circle.fill")
                        .resizable()
                        .font(Font.robotoRegular(size: 16))
                        .clipped()
                        .scaledToFit()
                        .imageScale(.medium)
                }
                .tag(1)
            //: TAB VIDEO
            MainSettingController()
                .onTapGesture {
                    self.selectedTab = 2
                }
                .tabItem {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .font(Font.robotoRegular(size: 16))
                        .clipped()
                        .scaledToFit()
                        .imageScale(.medium)
                }
                .tag(2)
            //: TAB SETTINGS
        }//: TABVEW
//        .tabViewStyle(/*@START_MENU_TOKEN@*/DefaultTabViewStyle()/*@END_MENU_TOKEN@*/)
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .background(Color.vybBackground)
        .onAppear() {
            UITabBar.appearance().barTintColor = UIColor.vybBackground
        }
        .accentColor(Color.primaryVybe)
        
    }
}

struct HomeTabController_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabController()
    }
}
