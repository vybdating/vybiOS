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
    @Environment(\.openURL) var openURL
    
    
    init() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    
    //MARK:Body
    var body: some View {
        NavigationView {
         ZStack {
            Image("Background")
                      .resizable()
                      .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                      .edgesIgnoringSafeArea(.all)
             //   .blur(radius: /*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
            //IMAGE
            Rectangle()
                   .foregroundColor(.clear)
                .background(LinearGradient(gradient: Gradient(colors: [Color.white.opacity(1.0),
                    Color.white.opacity(0.6),
                    Color.primaryVybe.opacity(0.4)]), startPoint: .top, endPoint: .bottom))
                .edgesIgnoringSafeArea(.all)
            //RECTANGLE
            Image("Gradient")
                      .resizable()
                      .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                      .edgesIgnoringSafeArea(.all)
                .opacity(0.6)
            // IMAGE
          
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0) {
              
                Image("LogoGreen")
                    .resizable()
                    .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .scaledToFill()
                    .padding(.top, 96)
                    .padding(.bottom, 16)
                    .clipped()
                    
                
                Text(Constants.tagLine)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .font(Font.robotoThin(size: 18))
                    .padding(.bottom, 64)

                Spacer()
                
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 16){
                    NavigationLink(destination: PhoneNumberController(), tag: NavigationPushedAction.phoneNumberAction, selection: $selection) {
                        DefaultButton(title: "Connect with phone number", action:{
                            self.selection = NavigationPushedAction.phoneNumberAction
                        }).clipped()
                    }
                    
                    NavigationLink(destination:  EmptyView(), tag: NavigationPushedAction.linkedInAction, selection: $selection) {
                        LinkedInButtonView(action:{
                            self.selection = NavigationPushedAction.linkedInAction
                        }).clipped()
                    }
                }//: VSTACK
                
                Text("We do not post on your page")
                    .font(Font.system(size: 12, weight: .light))
                    .foregroundColor(.white)
                    .font(Font.robotoThin(size: 8))
                    .multilineTextAlignment(.center)
                    .padding(.top, 16)
                    .padding(.bottom, 16)
                //: TEXT
                
                Button(action: {
                    openURL(URL(string: "https://www.apple.com")!)
                }) {
                    VStack{
                        Text("By continuing you agree to our")
                            .font(Font.robotoThin(size: 14))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                        
                        Text("Terms of service")
                            .underline()
                            .font(Font.robotoThin(size: 14))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.blue)
                    }
                    
                }
                //: BUTTON
                .padding(.top, 32)
                .padding(.bottom, 64)
                
            }.padding(32)
         }
         .navigationTitle("")
         .navigationBarTitle("")
         .navigationBarBackButtonHidden(true)
        }
    }
}

struct LoginController_Previews: PreviewProvider {
    static var previews: some View {
        LoginController()
    }
}
