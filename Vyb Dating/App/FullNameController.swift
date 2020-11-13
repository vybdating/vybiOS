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
    
    //MARK:Body
    var body: some View {
        
            VStack (alignment: .leading, spacing: 16) {
                  Text("What's your name")
                        .foregroundColor(.black)
                        .font(Font.system(size: 30, weight: .bold))
                        .padding(.bottom, 32)
                    
                   TextField("Enter First Name", text: $firstName)
                        .textContentType(.givenName)
                        .keyboardType(.alphabet)
                        .padding(16)
                        .font(.title3)
                        .foregroundColor(Color.black)
                        .accentColor(Color.black)
                        .background(RoundedRectangle(cornerRadius: 40).fill(Color.textFieldGrey))
                
                VStack {
                    TextField("Enter Last Name", text: $lastName)
                          .textContentType(.familyName)
                          .keyboardType(.alphabet)
                          .padding(16)
                          .font(.title3)
                          .foregroundColor(Color.black)
                          .accentColor(Color.black)
                          .background(RoundedRectangle(cornerRadius: 40).fill(Color.textFieldGrey))
                    
                    Text("we dont share your last name o your profile.")
                        .foregroundColor(.black)
                        .font(.callout)
                        .padding(0)
                }
                
               
                
                    NavigationLink(destination: PhoneNumberController(), tag: NavigationPushedAction.phoneNumberAction, selection: $selection) {
                        DefaultButton(title: "Next", action:{
                            self.selection = NavigationPushedAction.phoneNumberAction
                        }).clipped()
                    }.padding(.top, 64)
                
                    Spacer()
            }.padding([.leading,.trailing],32)
        
    }
}

struct FullNameController_Previews: PreviewProvider {
    static var previews: some View {
        FullNameController()
    }
}
