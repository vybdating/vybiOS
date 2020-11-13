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
    @State var alertMessage = "Something went wrong, Ttry again."
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
   
    //MARK: Body
    var body: some View {
         VStack(alignment: .leading, spacing: 4, content: {
            Text("Profile")
                .foregroundColor(.black)
                .font(Font.system(size: 30, weight: .bold))
                
            Text("we dont share your information with anyone.")
                .foregroundColor(.gray)
                .font(.body)
                .padding(.bottom, 32)
            
            VStack(alignment: .leading, spacing: 16){
                PickerInputView(placeHolder: "Height", selection: { selected in
                    print("SELECTED \(selected)")
                })
                
                PickerInputView(placeHolder: "Body Type", selection: { selected in
                    print("SELECTED \(selected)")
                })
                
                NavigationLink(destination: PhoneNumberController(), tag: NavigationPushedAction.phoneNumberAction, selection: $selection) {
                    DefaultButton(title: "Next", action:{
                        self.selection = NavigationPushedAction.phoneNumberAction
                    }).clipped()
                }.padding(.top, 64)
                
            }
            Spacer()
        }).padding([.leading,.trailing],32)
         .navigationTitle("")
         .navigationBarTitle(Text(""))
         .navigationBarBackButtonHidden(true)
         .navigationBarItems(leading:
                     Button(action: {
                         self.presentationMode.wrappedValue.dismiss()
                     }) {
                         Image("NavigationBack")
                             .resizable()
                             .imageScale(.large)
                             .scaledToFit()
                             .frame(width: 32, height: 64, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                             .clipped()
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
