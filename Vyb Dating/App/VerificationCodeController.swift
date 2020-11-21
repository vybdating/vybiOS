//
//  VerificationCodeController.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 13/11/2020.
//

import SwiftUI

struct VerificationCodeController: View {
    //MARK: Properties
    @State var selection: NavigationPushedAction? = nil
    @State var showAlert = false
    @State var alertMessage = "Something went wrong, Try again."
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var codeOne: String = ""
    @State var codeTwo: String = ""
    @State var codeThree: String = ""
    @State var codeFour: String = ""
    @State var phoneNumber: String = "(000) 000 - 0000"
    
    private func verifyWithPhoneNumber(){
        let code: String = codeOne + codeTwo + codeThree + codeFour
        
        print("CODE \(code)")
        //MARK: validate the string
        if code.count != 4 {
            self.showAlert = true
            return
        }
        
        self.selection = NavigationPushedAction.phoneNumberAction
    }
    
    var body: some View {
        VStack (alignment: .leading, spacing: 4) {
             Text("Enter 4 digit code")
                    .foregroundColor(.black)
                    .font(Font.system(size: 30, weight: .bold))
            
             Text("The code was sent to your mobile number.")
                 .foregroundColor(.gray)
                 .font(.body)
               
            VStack {
                Text("\(phoneNumber)")
                    .foregroundColor(Color.primaryVybe)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding([.top,.bottom], 16)
                    .frame(width: .infinity, height: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipped()
                
                HStack (alignment: .center, spacing: 16) {
                    
                    TextField("*", text: $codeOne)
                         .textContentType(.oneTimeCode)
                         .keyboardType(.numberPad)
                         .padding(8)
                         .font(.title3)
                         .multilineTextAlignment(.center)
                         .foregroundColor(Color.black)
                         .accentColor(Color.black)
                         .background(RoundedRectangle(cornerRadius: 4).fill(Color.textFieldGrey))
                    
                    Spacer()
                    
                    TextField("*", text: $codeTwo)
                         .textContentType(.oneTimeCode)
                         .keyboardType(.numberPad)
                         .padding(8)
                         .font(.title3)
                         .multilineTextAlignment(.center)
                         .foregroundColor(Color.black)
                         .accentColor(Color.black)
                         .background(RoundedRectangle(cornerRadius: 4).fill(Color.textFieldGrey))
                    
                    Spacer()
                    
                    TextField("*", text: $codeThree)
                         .textContentType(.oneTimeCode)
                         .keyboardType(.numberPad)
                         .padding(8)
                         .font(.title3)
                         .multilineTextAlignment(.center)
                         .foregroundColor(Color.black)
                         .accentColor(Color.black)
                         .background(RoundedRectangle(cornerRadius: 4).fill(Color.textFieldGrey))
                    
                    Spacer()
                    
                    TextField("*", text: $codeFour)
                        .textContentType(.oneTimeCode)
                          .keyboardType(.numberPad)
                          .padding(8)
                          .font(.title3)
                          .multilineTextAlignment(.center)
                          .foregroundColor(Color.black)
                          .accentColor(Color.black)
                          .background(RoundedRectangle(cornerRadius: 4).fill(Color.textFieldGrey))
                    
                }.padding([.top,.bottom], 16)
                .frame(width: .infinity, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipped()
                //: HSTACK
               
                    NavigationLink(destination: PhoneNumberController(), tag: NavigationPushedAction.phoneNumberAction, selection: $selection) {
                        DefaultButton(title: "Continue", action:{
                            self.verifyWithPhoneNumber()
                        }).clipped()
                    }.padding(.top, 64)
            }
            
           
            
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

struct VerificationCodeController_Previews: PreviewProvider {
    static var previews: some View {
        VerificationCodeController()
    }
}
