//
//  PreferenceSettingsControlller.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 22/11/2020.
//

import SwiftUI

struct PreferenceSettingsControlller: View {
    
    
    
    init() {
        UITableView.appearance().backgroundColor = UIColor.vybBackground
    }
    
    //MARK: BOODY
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0) {
            Form {
               
                Section {
                    SettingsRowView(title: "Age", value: "18 to 30", icon: "bandage")
                    SettingsRowView(title: "Height", value: "Accra", icon: "square.and.line.vertical.and.square")
                }
                //SECTION 1
                .background(Color.clear)
                .listRowBackground(Color.textFieldGrey)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 8))
                .padding(2)
                
                
                Section {
                    SettingsRowView(title: "Education", value: "18 to 30", icon: "house")
                    SettingsRowView(title: "Religion", value: "Accra", icon: "hand.thumbsup")
                }
                //SECTION 1
                .background(Color.clear)
                .listRowBackground(Color.textFieldGrey)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 8))
                .padding(2)
               
                Section {
                    SettingsRowView(title: "Race", value: "Accra", icon: "person.crop.circle")
                    SettingsRowView(title: "Body Type", value: "Accra", icon: "hand.raised")
                    SettingsRowView(title: "Gender", value: "M", icon: "smiley")
                }
                //SECTION 2
                .background(Color.clear)
                .listRowBackground(Color.textFieldGrey)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 8))
                .padding(2)
               
                Section {
                    SettingsRowView(title: "Distance", value: "Accra", icon: "location.north.line")
                }
                //SECTION 3
                .background(Color.clear)
                .listRowBackground(Color.textFieldGrey)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 8))
                .padding(2)
                
            }
            //: FORM
            .padding(0)
            .listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular)
            .background(Color.vybBackground)
        }
        //: VSATCK
        .padding(0)
        .background(Color.vybBackground)
        
    }
    
}

struct PreferenceSettingsControlller_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceSettingsControlller()
    }
}
