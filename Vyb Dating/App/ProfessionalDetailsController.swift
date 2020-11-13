//
//  ProfessionalDetailsController.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 13/11/2020.
//

import SwiftUI

struct ProfessionalDetailsController: View {
    //MARK: Properties
    @State var selection: NavigationPushedAction? = nil
    @State var showAlert = false
    @State var alertMessage = "Something went wrong, Ttry again."
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var jobTitle: String = ""
    @State var school: String = ""
    
    
    var body: some View {
        VStack (alignment: .leading, spacing: 4) {
              Text("Professional Details")
                    .foregroundColor(.black)
                    .font(Font.system(size: 30, weight: .bold))
            
              Text("With your professional details, we can easily match you with the right person.")
                 .foregroundColor(.gray)
                 .font(.body)
                 .padding(.bottom, 32)
            
            
            VStack (alignment: .leading, spacing: 16) {
                
                TextField("Job Title", text: $jobTitle)
                     .textContentType(.givenName)
                     .keyboardType(.alphabet)
                     .padding(16)
                     .font(.title3)
                     .foregroundColor(Color.black)
                     .accentColor(Color.black)
                     .background(RoundedRectangle(cornerRadius: 40).fill(Color.textFieldGrey))
                
                TextField("School Eg. NYU", text: $school)
                      .textContentType(.familyName)
                      .keyboardType(.alphabet)
                      .padding(16)
                      .font(.title3)
                      .foregroundColor(Color.black)
                      .accentColor(Color.black)
                      .background(RoundedRectangle(cornerRadius: 40).fill(Color.textFieldGrey))
                
            }
            
           
            
                NavigationLink(destination: PhoneNumberController(), tag: NavigationPushedAction.phoneNumberAction, selection: $selection) {
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

struct ProfessionalDetailsController_Previews: PreviewProvider {
    static var previews: some View {
        ProfessionalDetailsController()
    }
}