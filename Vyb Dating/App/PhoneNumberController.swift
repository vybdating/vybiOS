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
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    //Number view called
    var numberInputView =  NumberInputView(action: {
        //MARK: START Country picker action
    })
    
    private func startCheckingNumber(){
        let phone = numberInputView.code + numberInputView.phoneNumber
        print("NO. \(phone)")
        if  numberInputView.phoneNumber.isEmpty {
            self.showAlert = true
            return
        }
        
        print("VALID NO. \(phone)")
    }
    
    //MARK:Body
    var body: some View {
            VStack(alignment: .leading, spacing: 4) {
                Text("What's your number?")
                    .foregroundColor(.black)
                    .font(Font.system(size: 30, weight: .bold))
                    
                Text("We dont share your information with anyone.")
                    .foregroundColor(.gray)
                    .font(.body)
                
                VStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 32) {
                        numberInputView
                        DefaultButton(title: "Get Started" ,action:{
                            self.startCheckingNumber()
                        }).clipped().padding(.top, 64)
                }.padding([.top],64)
                //: VSTACK
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

struct PhoneNumberController_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumberController()
    }
}
