//
//  VerificationCodeController.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 13/11/2020.
//

import SwiftUI
import Combine


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
    @State var phoneNumber: String
    let textLimit = 1 //Your limit
    
    
    
    private func verifyWithPhoneNumber(){
        let code: String = codeOne + codeTwo + codeThree + codeFour
        
        //MARK: validate the string
        if code.count != 4 {
            self.showAlert = true
            return
        }
        
        self.selection = NavigationPushedAction.phoneNumberVerificationAction
    }
    
    var body: some View {
        VStack (alignment: .leading, spacing: 4) {
             Text("Enter 4 digit code")
                    .foregroundColor(.black)
                    .font(Font.robotoBold(size: 30))
            
             Text("The code was sent to your mobile number.")
                 .foregroundColor(.gray)
                 .font(Font.robotoThin(size: 15))
               
            VStack(alignment: .center, spacing: 16) {
                
                Text("\(phoneNumber.formatNumber())")
                    .foregroundColor(Color.primaryVybe)
                    .font(Font.robotoBlack(size: 24))
                    .multilineTextAlignment(.center)
                    .padding([.top,.bottom], 16)
                    .clipped()
                
                HStack (alignment: .center, spacing: 16) {
                    
                    TextField("*", text: $codeOne)
                         .textContentType(.oneTimeCode)
                         .keyboardType(.numberPad)
                         .padding(16)
                         .font(Font.robotoBlack(size: 20))
                         .multilineTextAlignment(.center)
                         .onReceive(Just(codeOne)) { _ in limitText(textLimit) }
                         .foregroundColor(Color.black)
                         .accentColor(Color.black)
                         .background(RoundedRectangle(cornerRadius: 8).fill(Color.textFieldGrey))
                    
                    Spacer()
                    
                    TextField("*", text: $codeTwo)
                         .textContentType(.oneTimeCode)
                         .keyboardType(.numberPad)
                         .padding(16)
                         .font(Font.robotoBlack(size: 20))
                         .multilineTextAlignment(.center)
                         .foregroundColor(Color.black)
                         .accentColor(Color.black)
                         .background(RoundedRectangle(cornerRadius: 8).fill(Color.textFieldGrey))
                    
                    Spacer()
                    
                    TextField("*", text: $codeThree)
                         .textContentType(.oneTimeCode)
                         .keyboardType(.numberPad)
                         .padding(16)
                         .font(Font.robotoBlack(size: 20))
                         .multilineTextAlignment(.center)
                         .foregroundColor(Color.black)
                         .accentColor(Color.black)
                         .background(RoundedRectangle(cornerRadius: 8).fill(Color.textFieldGrey))
                    
                    Spacer()
                    
                    TextField("*", text: $codeFour)
                        .textContentType(.oneTimeCode)
                          .keyboardType(.numberPad)
                          .padding(16)
                          .font(Font.robotoBlack(size: 20))
                          .multilineTextAlignment(.center)
                          .foregroundColor(Color.black)
                          .accentColor(Color.black)
                          .background(RoundedRectangle(cornerRadius: 8).fill(Color.textFieldGrey))
                    
                }.padding([.top,.bottom], 16)
                .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipped()
                
//                ProgressView()
//                        .scaleEffect(1.5, anchor: .center)
//                    .progressViewStyle(CircularProgressViewStyle(tint: Color.vybGreen))
//
//
                  //: HSTACK
                    NavigationLink(destination:  FullNameController(), tag: NavigationPushedAction.phoneNumberVerificationAction, selection: $selection) {
                        DefaultButton(title: "Continue", action:{
                            self.verifyWithPhoneNumber()
                        }).clipped()
                    }.padding(.top, 32)
            }
            
           
            
          Spacer()
            
        }.padding([.leading,.trailing],32)
        .navigationTitle("")
        .navigationBarTitle("", displayMode: .inline)
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
    
    //0821069039
    //Function to keep text length in limits
    func limitText(_ upper: Int) {
        if codeOne.count > upper {
            codeOne = String(codeOne.prefix(upper))
        }
    }
    
}

#if DEBUG
struct VerificationCodeController_Previews: PreviewProvider {
    static var previews: some View {
        VerificationCodeController(phoneNumber: "+233500294411")
    }
}
#endif
