//
//  MainSettingController.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 22/11/2020.
//

import SwiftUI

struct MainSettingController: View {
    //MARK: PROPERTIES
    @State private var showEditPrefs = true
    private let settingsTabs = ["Edit Preferences", "Edit Profile"]
   
    //MARK: - BODY
    var body: some View {
        let startColorDisabaled = !showEditPrefs ? Color.white : Color.primaryVybe
        let endColorDisabaled = !showEditPrefs ? Color.white : Color.primaryVybe
        let forColorDisabaled = !showEditPrefs ? Color.black : Color.white
        
        let settingStartColorDisabaled = showEditPrefs ? Color.white : Color.primaryVybe
        let settingEndColorDisabaled = showEditPrefs ? Color.white : Color.primaryVybe
        let settingForColorDisabaled = showEditPrefs ? Color.black : Color.white
        
        NavigationView {
            VStack(alignment: .center, spacing: 0) {
                HStack{
                    DefaultButton(title: settingsTabs[0], disabled: false, backgroundStartColor: startColorDisabaled, backgroundEndColor: endColorDisabaled, foregroundColor: forColorDisabaled, font: Font.robotoThin(size: 15),action:{
                        self.showEditPrefs = true
                    }).padding(4)
                        
                    DefaultButton(title: settingsTabs[1], disabled: false, backgroundStartColor: settingStartColorDisabaled, backgroundEndColor: settingEndColorDisabaled, foregroundColor: settingForColorDisabaled, font: Font.robotoThin(size: 15),action:{
                        self.showEditPrefs = false
                    }).padding(4)
                }
                //HSTACK
                .clipped()
                .cornerRadius(44)
                .overlay(
                    RoundedRectangle(cornerRadius: 44)
                        .stroke(Color.gray, lineWidth: 0.5)
                )
                //MARK: PREFS
                if (self.showEditPrefs) {
                    PreferenceSettingsControlller()
                } else {
                    ProfileSettingsController()
                }
               
                Spacer()
                //MARK: SPACER
                
                Text("Copyright @ All right reserved")
                    .font(Font.robotoThin(size: 12))
                    .foregroundColor(Color.secondary)
                    .font(Font.robotoThin(size: 12))
                    .padding()
            }
            //: VSTACK
            .background(Color.vybBackground)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .padding([.leading,.trailing],8)
            .padding([.top,],10)
            .navigationTitle(Text("Profile and Preferences").font(Font.robotoThin(size: 16)))
            .navigationBarTitle(Text("Profile and Preferences").font(Font.robotoThin(size: 16)), displayMode: .inline)
        }//: NAVIGATION
    }
}

struct MainSettingController_Previews: PreviewProvider {
    static var previews: some View {
        MainSettingController()
    }
}
