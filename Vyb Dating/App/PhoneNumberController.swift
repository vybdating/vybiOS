//
//  ContentView.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 11/11/2020.
//

import SwiftUI

struct PhoneNumberController: View {
    //MARK: Properties
    
    
    //MARK:Body
    var body: some View {
        ZStack {
            Image("background")
                      .resizable()
                      .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                      .edgesIgnoringSafeArea(.all)
                .blur(radius: /*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
      
            Rectangle()
                   .foregroundColor(.clear)
                .background(LinearGradient(gradient: Gradient(colors: [Color.primaryVybe.opacity(0.5), Color.primaryVybe.opacity(0.6)]), startPoint: .top, endPoint: .bottom))
                .edgesIgnoringSafeArea(.all)
               
          
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0) {
                Spacer()
                
                Image("LogoWhite")
                    .resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .scaledToFill()
                    .padding(.bottom, 16)
                    .clipped()
                    
                
                Text("Welcome to Vyb")
                    .foregroundColor(.white)
                    .padding()
                    .font(.largeTitle)
                
                
                Text("Stop swiping and put your personality first. Feel the Vyb")
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 64)

                DefaultButton(title: "Get Started", backgroundColor: .primaryVybe, action:{
                    
                })
                
                Button(action: {
                               print("Click")
                }) {
                    Text("Terms & Conditions").font(.body).foregroundColor(.white)
                }
                .padding(.top, 32)
                .padding(.bottom, 32)
                
            }.padding(16)
        }
    }
}

struct PhoneNumberController_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumberController()
    }
}
