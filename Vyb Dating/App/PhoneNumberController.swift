//
//  ContentView.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 11/11/2020.
//

import SwiftUI
import PhoneNumberKit



struct PhoneNumberController: View {
    //MARK: Properties
    @State var showAlert = false
    @State var alertMessage = "Enter a valid phone to proceed."
    @State var confirmNumberMessage = "Proceed with the number: "
    @State var confirmNumberPrompt = false
    @State var showVerification = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var code : String = ""
    @State private var number : String = ""
    let phoneNumberKit = PhoneNumberKit()
    
    //MARK: number with code
    var fullNumber: String {
        "\(code)\(number)"
    }
    
    //MARK: message on the alert popup
    var promptMessage: String {
        !self.confirmNumberPrompt ? alertMessage : "\(confirmNumberMessage) \(self.code)\(self.number)"
    }
    
    //MARK: action on the alert popup
    var alertAction: String {
        !self.confirmNumberPrompt ? "OK" : "PROCEED"
    }
    
    //MARK: init the phone number action
    private func startCheckingNumber(){
        
        print("No. \(fullNumber)")
        
        if  !phoneNumberKit.isValidPhoneNumber(fullNumber) {
            self.confirmNumberPrompt = false
            self.showAlert = true
            return
        }
        
        //MARK: number valid proceed
        self.confirmNumberPrompt = true
        self.showAlert = true
       
    }
    
   
    
    //MARK:Body
    var body: some View {
         ScrollView {
            VStack(alignment: .leading, spacing: 4) {
                
                Text("What's your number?")
                    .font(Font.robotoBold(size: 30))
                    
                Text("We don’t share your number with anyone.")
                    .foregroundColor(.gray)
                    .font(Font.robotoThin(size: 15))
                
                VStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 32) {
                   
                    NumberInputView(code: $code, number: $number)
                    //NUMBER VIEW
                    
                    //MARK: show next screen
                    NavigationLink(destination: VerificationCodeController( phoneNumber: "\(code)\(number)"), isActive: $showVerification) {
        
                        DefaultButton(title: "Get Started" ,action:{
                            self.startCheckingNumber()
                        })
                        //: BUTTON
                        .clipped()
                        .padding(.top, 0)
                    }
                    
                }.padding([.top],64)
                //: VSTACK
                Spacer()
            }
            .padding([.leading,.trailing],32)
            .navigationBarItems(leading:
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            BackIconView()
                        }
                )
            .navigationTitle("")
            .navigationBarTitle("")
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            //display alert message
            .alert(isPresented: $showAlert) { () -> Alert in
                    Alert(
                        title: Text(Constants.displayName),
                        message: Text("\(promptMessage)"),
                        dismissButton: .default(Text(self.alertAction).foregroundColor( Color.primaryVybe), action: {
                            if (self.confirmNumberPrompt){
                                self.showVerification = true
                            }
                        })
                    )
            }//MESSAGE ALERT
         }//SCROLLVIEW END
         .background(Color.vybBackground)
    }
}

struct PhoneNumberController_Previews: PreviewProvider {
    
    static var previews: some View {
        PreviewWrapper()
    }
    
    struct PreviewWrapper: View {
      
        var body: some View {
            PhoneNumberController()
        }
      }
}
