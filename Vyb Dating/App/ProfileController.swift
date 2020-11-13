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
    @State var alertMessage = "Something went wrong, Try again."
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var feetSelected = 5
    @State var inchSelected = 5
    let bodyTypes = ["Ectomorphs","Endomorphs","Mesomorphs"]
    
   
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
                VStack (alignment: .leading, spacing: 8) {
                    Text("Height")
                        .foregroundColor(.black)
                        .font(.headline)
                        .padding(.bottom, 0)
                    
                    HStack(alignment: .center, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/) {
                        VStack {
                            Text("Feet")
                                .foregroundColor(.gray)
                                .font(.body)
                                .padding(.bottom, 0)
                            Picker(selection: $feetSelected, label: Text("Feet")) {
                                   ForEach(0..<10) {
                                     Text("\($0)").tag($0)
                                    }
                            }.labelsHidden()
                            .clipped()
                        }
                        .labelsHidden()
                        .frame(width: 150, height: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .clipped()
                        Spacer()
                        VStack {
                            Text("Inch")
                                .foregroundColor(.gray)
                                .font(.body)
                                .padding(.bottom, 0)
                            Picker(selection: $inchSelected, label: Text("Inch")) {
                                ForEach(0..<10) {
                                  Text("\($0)").tag($0)
                                 }
                            }
                        }.frame(width: 150, height: .infinity, alignment: .center)
                        .clipped()
                    }
                    .clipped()
                }
               
                PickerInputView(placeHolder: "Body Type", options: self.bodyTypes, selection: { selected in
                    print("SELECTED \(selected)")
                }).padding(.top, 16)
                
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
