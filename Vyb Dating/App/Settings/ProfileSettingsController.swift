//
//  ProfileSettingsController.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 22/11/2020.
//

import SwiftUI

struct ProfileSettingsController: View {
    //MARK: PRPERTIES
    
    init() {
        UITableView.appearance().backgroundColor = UIColor.vybBackground
    }
    
    //MARK: BODY
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0) {
            Form {
                VStack(alignment: .center, spacing: 0) {
                    ZStack{
                        Image("Background")
                            .resizable()
                            .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .scaledToFit()
                            .cornerRadius(100)
                            .imageScale(.large)
                            .clipped()
                    }
                    //ZSTACK
                    Text(Constants.displayName)
                        .font(Font.robotoBlack(size: 24))
                        .multilineTextAlignment(.center)
                        .padding([.top,.bottom], 8)
                }
                //: VSTACK
                .frame(width: UIScreen.main.bounds.width - 48, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipped()
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                Section {
                    SettingsRowView(title: "Location", value: "Accra", icon: "gear")
                    SettingsRowView(title: "Height", value: "Accra", icon: "gear")
                    SettingsRowView(title: "Religion", value: "Accra", icon: "gear")
                }
                //SECTION 1
                .background(Color.clear)
                .listRowBackground(Color.textFieldGrey)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 8))
                .padding(2)
                
               
                Section {
                    SettingsRowView(title: "Race", value: "Accra", icon: "gear")
                    SettingsRowView(title: "Body Type", value: "Accra", icon: "gear")
                    SettingsRowView(title: "School", value: "Accra", icon: "gear")
                }
                //SECTION 2
                .background(Color.clear)
                .listRowBackground(Color.textFieldGrey)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 8))
                .padding(2)
               
                Section {
                    SettingsRowView(title: "Job Title", value: "Accra", icon: "gear")
                    SettingsRowView(title: "Industry", value: "Accra", icon: "gear")
                    SettingsRowView(title: "Relationship Status", value: "Accra", icon: "gear")
                }
                //SECTION 3
                .background(Color.clear)
                .listRowBackground(Color.textFieldGrey)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 8))
                .padding(2)
                
                Section {
                    SettingsRowView(title: "Do you smoke?", value: "Accra", icon: "gear")
                    SettingsRowView(title: "Do you drink?", value: "Accra", icon: "gear")
                    SettingsRowView(title: "Do you want children?", value: "Yes", icon: "gear")
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
            .background(Color.clear)
        }
        //: VSATCK
        .padding(0)
        .background(Color.vybBackground)
        
    }
}

struct ProfileSettingsController_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSettingsController()
    }
}
