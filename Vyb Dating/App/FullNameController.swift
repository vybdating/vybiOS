//
//  FullNameController.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 12/11/2020.
//

import SwiftUI

struct FullNameController: View {
    //MARK: Properties
    @State var selection: NavigationPushedAction? = nil
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var showAlert = false
    @State var alertMessage = "Something went wrong, Ttry again."
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var phoneNumber = ""
    
    //MARK:Body
    var body: some View {
        
        ScrollView{
        
            VStack (alignment: .leading, spacing: 4) {
                Text("What's your name")
                        .foregroundColor(.black)
                        .font(Font.robotoBold(size: 30))
                      
                Text("People identify you by these details.\nMake it cont")
                    .foregroundColor(.gray)
                    .font(Font.robotoThin(size: 15))
                    .padding(.bottom, 32)
                    
                  
                VStack (alignment: .center, spacing: 16) {
                    TextField("Enter First Name", text: $firstName)
                         .textContentType(.givenName)
                         .keyboardType(.alphabet)
                         .padding(16)
                         .font(Font.robotoThin(size: 16))
                         .foregroundColor(Color.black)
                         .accentColor(Color.black)
                         .background(RoundedRectangle(cornerRadius: 40).fill(Color.textFieldGrey))
                 
                    
                    TextField("Enter Last Name", text: $lastName)
                          .textContentType(.familyName)
                          .keyboardType(.alphabet)
                          .padding(16)
                          .font(Font.robotoThin(size: 16))
                          .foregroundColor(Color.black)
                          .accentColor(Color.black)
                          .background(RoundedRectangle(cornerRadius: 40).fill(Color.textFieldGrey))
                    
                    Text("we don't share your last name o your profile.")
                        .foregroundColor(.black)
                        .font(Font.robotoThin(size: 12))
                        .multilineTextAlignment(.center)
                        .padding([.leading,.trailing], 16)
                    
                }
                
               
                
                    NavigationLink(destination:  EmptyView(), tag: NavigationPushedAction.phoneNumberAction, selection: $selection) {
                        DefaultButton(title: "Next", action:{
                            self.selection = NavigationPushedAction.phoneNumberAction
                        }).clipped()
                    }.padding(.top, 64)
                
                    Spacer()
            }.padding([.leading,.trailing],32)
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
}

struct FullNameController_Previews: PreviewProvider {
    static var previews: some View {
        FullNameController()
    }
}
