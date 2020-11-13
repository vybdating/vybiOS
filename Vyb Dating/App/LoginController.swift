//
//  LoginController.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 11/11/2020.
//

import SwiftUI

struct LoginController: View {
    //MARK: Properties
    @State var selection: NavigationPushedAction? = nil
    
    
    //MARK:Body
    var body: some View {
        NavigationView {
         ZStack {
            Image("Background")
                      .resizable()
                      .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                      .edgesIgnoringSafeArea(.all)
                .blur(radius: /*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
            //IMAGE
      
            Rectangle()
                   .foregroundColor(.clear)
                .background(LinearGradient(gradient: Gradient(colors: [Color.white.opacity(1.0),
                    Color.white.opacity(0.8),
                    Color.primaryVybe.opacity(0.4)]), startPoint: .top, endPoint: .bottom))
                .edgesIgnoringSafeArea(.all)
            //RECTANGLE
          
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0) {
              
                Image("LogoGreen")
                    .resizable()
                    .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .scaledToFill()
                    .padding(.top, 96)
                    .padding(.bottom, 16)
                    .clipped()
                    
                
                Text(Constants.tagLine)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 64)

                Spacer()
                
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 16){
                    NavigationLink(destination: PhoneNumberController(), tag: NavigationPushedAction.phoneNumberAction, selection: $selection) {
                        DefaultButton(title: "Connect with phone number", action:{
                            self.selection = NavigationPushedAction.phoneNumberAction
                        }).clipped()
                    }
                    
                    NavigationLink(destination: PhoneNumberController(), tag: NavigationPushedAction.linkedInAction, selection: $selection) {
                        LinkedInButtonView(action:{
                            self.selection = NavigationPushedAction.linkedInAction
                        }).clipped()
                    }
                }//: VSTACK
                Text("We do not post on your page")
                    .font(Font.system(size: 12, weight: .light))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.top, 16)
                    .padding(.bottom, 16)
                //: TEXT
                Button(action: {
                               print("Click")
                }) {
                    Text("By continuing you agree to our \nTerms of service")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                }
                //: BUTTON
                .padding(.top, 32)
                .padding(.bottom, 64)
                
            }.padding(32)
         }
        }.navigationTitle("")
        .navigationBarTitle(Text(""), displayMode: .inline)
        
    }
}

struct LoginController_Previews: PreviewProvider {
    static var previews: some View {
        LoginController()
    }
}
