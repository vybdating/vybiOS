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
        UITableView.appearance().tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: Double.leastNonzeroMagnitude))
       
       UITableView.appearance().contentInset.top = 0
       UITableView.appearance().contentInset.left = 0
       UITableView.appearance().contentInset.right = 0
       UITableView.appearance().contentInset.bottom = 0
    }
    
    //MARK: BODY
    var body: some View {
            Form {
                VStack(alignment: .center, spacing: 4) {
                    Spacer()
                    ZStack{
                        
                        Image("Background")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(100)
                            .imageScale(.large)
                            .clipped()
                          
                        ZStack{
                            
                            Circle()
                                .foregroundColor(Color.vybGreen)
                                .background(Color.vybGreen)
                                .frame(width: 32, height: 32, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .cornerRadius(32)
                                .opacity(0.6)
                                .clipped()
                            //: CIRCLE
                            
                            Image(systemName: "camera")
                                .resizable()
                                .scaledToFit()
                                .imageScale(.small)
                                .foregroundColor(Color.white)
                                .frame(width: 18, height: 18, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .clipped()
                            //: IMAGE
                                
                        }.offset(x: 50, y: 0)
                        
                    }
                    //ZSTACK
                    Text(Constants.displayName)
                        .font(Font.robotoBlack(size: 24))
                        .multilineTextAlignment(.center)
                        .padding([.top,.bottom], 8)
                }
                //: VSTACK
                .listRowBackground(Color.textFieldGrey)
                .frame(width: UIScreen.main.bounds.width - 48, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .clipped()
                
                Section {
                    SettingsRowView(title: "Location", value: "Accra", icon: "location.circle")
                    SettingsRowView(title: "Height", value: "Accra", icon: "square")
                    SettingsRowView(title: "Religion", value: "Accra", icon: "hand.thumbsup")
                }
                //SECTION 1
                .listRowBackground(Color.textFieldGrey)
                .listRowInsets(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                .padding(2)
                
                Section {
                    SettingsRowView(title: "Race", value: "Accra", icon: "person.crop.circle")
                    SettingsRowView(title: "Body Type", value: "Accra", icon: "hand.raised")
                    SettingsRowView(title: "School", value: "Accra", icon: "house")
                }
                //SECTION 2
                .listRowBackground(Color.textFieldGrey)
                .listRowInsets(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                .padding(2)
               
                Section {
                    SettingsRowView(title: "Job Title", value: "Accra", icon: "briefcase")
                    SettingsRowView(title: "Industry", value: "Accra", icon: "house")
                    SettingsRowView(title: "Relationship Status", value: "Accra", icon: "checkmark.square")
                }
                //SECTION 3
                .listRowBackground(Color.textFieldGrey)
                .listRowInsets(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                .padding(2)
                
                Section{
                    SettingsRowView(title: "Do you smoke?", value: "Accra", icon: "smoke")
                    SettingsRowView(title: "Do you drink?", value: "Accra", icon: "capsule")
                                SettingsRowView(title: "Do you want children?", value: "Yes", icon: "person.and.person")
                }
                //SECTION 4
                .listRowBackground(Color.textFieldGrey)
                .listRowInsets(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                .padding(2)
                
                
            }
            //: FORM
            .padding(0)
            .listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular)
            .background(Color.vybBackground)
        }
        
    
        
}

struct ProfileSettingsController_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSettingsController()
    }
}
