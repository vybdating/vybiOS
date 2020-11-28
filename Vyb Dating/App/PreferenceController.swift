//
//  PreferenceController.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 21/11/2020.
//

import SwiftUI

struct PreferenceController: View {
    //MARK: PROPERTIES
    @State var selection: NavigationPushedAction? = nil
    @State var showAlert = false
    @State var alertMessage = "Something went wrong, Try again."
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var feetSelected = 5
    @State var inchSelected = 5
    @State var showHeightPicker = false
    
    //MARK: Body
    var body: some View {
         VStack (alignment: .leading, spacing: 4) {
            
            Text("Preferences")
                .foregroundColor(.black)
                .font(Font.robotoBold(size: 30))
                
            Text("Vyb will match you to date based on your preferences.")
                .foregroundColor(.gray)
                .font(Font.robotoThin(size: 15))
                .padding(.bottom, 32)
            
            VStack(alignment: .leading, spacing: 16){
                PickerInputView(placeHolder: "Age", options: ConstantOptions.bodyTypesOptions, selection: { selected in
                    print("SELECTED \(selected)")
                })
            
                //MARK: navigate to the height picker screen
                NavigationLink(destination: HeightPickerView(feetSelected: $feetSelected, inchSelected: $inchSelected), isActive: $showHeightPicker) {
                    
                    PickerButtonView(placeHolderText: "Height" ,action: {
                        self.showHeightPicker = true
                    })
                }
            
                PickerInputView(placeHolder: "Education", options: ConstantOptions.educationalOptions, selection: { selected in
                    print("SELECTED \(selected)")
                })
                
                PickerInputView(placeHolder: "Ethnicity", options: ConstantOptions.raceOptions, selection: { selected in
                    print("SELECTED \(selected)")
                })
                
                NavigationLink(destination:  EmptyView(), tag: NavigationPushedAction.phoneNumberAction, selection: $selection) {
                    DefaultButton(title: "Next", action:{
                        self.selection = NavigationPushedAction.phoneNumberAction
                    }).clipped()
                }.padding(.top, 64)
                
            }
            Spacer()
        }
         //VSTACK
         .padding([.leading,.trailing],32)
         .navigationTitle("")
         .navigationBarTitle(Text(""))
         .navigationBarBackButtonHidden(true)
         .navigationBarItems(leading:
                     Button(action: {
                         self.presentationMode.wrappedValue.dismiss()
                     }) {
                        BackIconView()
                     }
             ).alert(isPresented: $showAlert) { () -> Alert in
                 Alert(title: Text(Constants.displayName), message: Text("\(alertMessage)"))
             }
      
    }
    
}

struct PreferenceController_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceController()
    }
}
