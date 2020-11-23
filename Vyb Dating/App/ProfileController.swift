//
//  ProfileController.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 12/11/2020.
//

import SwiftUI

struct ProfileController: View {
    //MARK: Properties
    @State var selection: NavigationPushedAction? = nil
    @State var showAlert = false
    @State var showHeightPicker = false
    @State var alertMessage = "Something went wrong, Try again."
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  
    let bodyTypes = ["Ectomorphs","Endomorphs","Mesomorphs"]
    @State var feetSelected = 5
    @State var inchSelected = 2
    @State var startPicker = false
    
    var selectHeight: String  {
        startPicker ? "\(feetSelected)'' \(inchSelected)'" : "Height"
    }
    

    //MARK: Body
    var body: some View {
         VStack(alignment: .leading, spacing: 4, content: {
           
            Text("Profile")
                .foregroundColor(.black)
                .font(Font.robotoBold(size: 30))
                
            Text("we dont share your information with anyone.")
                .foregroundColor(.gray)
                .font(Font.robotoThin(size: 15))
                .padding(.bottom, 32)
            
            VStack(alignment: .leading, spacing: 16){
                
                //MARK: navigate to height picker screen
                NavigationLink(destination: HeightPickerView(feetSelected: $feetSelected, inchSelected: $inchSelected), isActive: $showHeightPicker) {
                    
                    PickerButtonView(placeHolderText: "\(selectHeight)" ,action: {
                        self.startPicker = true
                        self.showHeightPicker = true
                    })
                }
               
                PickerInputView(placeHolder: "Body Type", options: self.bodyTypes, selection: { selected in
                    print("SELECTED \(selected)")
                })
                
                NavigationLink(destination:  EmptyView(), tag: NavigationPushedAction.phoneNumberAction, selection: $selection) {
                    DefaultButton(title: "Next", action:{
                        self.selection = NavigationPushedAction.phoneNumberAction
                    }).clipped()
                }.padding(.top, 64)
                
            }
            //: VSTACK
            Spacer()
        })
         //VSTACK
         .padding([.leading,.trailing],32)
         .navigationTitle("")
         .navigationBarTitle(Text(""), displayMode: .inline)
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


struct ProfileController_Previews: PreviewProvider {
    static var previews: some View {
        ProfileController()
    }
}
