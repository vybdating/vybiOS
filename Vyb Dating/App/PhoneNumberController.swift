//
//  ContentView.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 11/11/2020.
//

import SwiftUI


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
    
    
    
    //MARK: init the phone number action
    private func startCheckingNumber(){
        if  number.isEmpty {
            self.showAlert = true
            return
        }
        self.confirmNumberPrompt = true
    }
    
    //MARK:Body
    var body: some View {
         ScrollView {
            VStack(alignment: .leading, spacing: 4) {
                //MARK: show next screen
                NavigationLink(destination: VerificationCodeController( phoneNumber: "\(code)\(number)"), isActive: $showVerification) { EmptyView() }
                Text("What's your number?")
                    .font(Font.robotoBold(size: 30))
                    
                Text("We dont share your information with anyone.")
                    .foregroundColor(.gray)
                    .font(Font.robotoThin(size: 15))
                
                VStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 32) {
                        NumberInputView(code: $code, number: $number)
                            //NUMBER VIEW
                        DefaultButton(title: "Get Started" ,action:{
                            self.startCheckingNumber()
                        }).clipped().padding(.top, 0)
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
            //Error alert session start
            .alert(isPresented: $showAlert) { () -> Alert in
                    Alert(title: Text(Constants.displayName), message: Text("\(alertMessage)"))
                }
            //Number confirmation prompt start
            .alert(isPresented: $confirmNumberPrompt) { () -> Alert in
                    Alert(
                        title: Text(Constants.displayName),
                        message: Text("\(confirmNumberMessage) \(self.code)\(self.number)"),
                        dismissButton: .default(Text("PROCEED").foregroundColor( Color.primaryVybe), action: {
                            self.showVerification = true
                    
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
