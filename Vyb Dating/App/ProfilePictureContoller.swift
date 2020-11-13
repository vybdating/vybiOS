//
//  ProfilePictureContoller.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 13/11/2020.
//

import SwiftUI

struct ProfilePictureContoller: View {
    //MARK: Properties
    @State var selection: NavigationPushedAction? = nil
    @State var showAlert = false
    @State var alertMessage = "Something went wrong, Ttry again."
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let gradient = LinearGradient(gradient: Gradient(colors: [Color.primaryVybe,Color.vybGreen]), startPoint: .top, endPoint: .bottom)

    var body: some View {
        VStack(alignment: .leading, spacing: 4, content: {
           Text("Profile Picture")
               .foregroundColor(.black)
               .font(Font.system(size: 30, weight: .bold))
               
           Text("This is will be your only picture on Vyb.\nChoose carefully.")
               .foregroundColor(.gray)
               .font(.body)
               .padding(.bottom, 32)
           
           VStack(alignment: .center, spacing: 16){
        
                    ZStack{
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(Color.textFieldGrey, lineWidth: 0)
                            .shadow(color: .black, radius: 2, x: 0, y: 2)
                            .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(gradient)
                            .cornerRadius(50)
                        
                        Image("UserProfile")
                            .resizable()
                            .frame(width: 120, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(50)
                            .scaledToFit()
                            .clipped()
                    }
                   
               NavigationLink(destination: PhoneNumberController(), tag: NavigationPushedAction.phoneNumberAction, selection: $selection) {
                   DefaultButton(title: "Next", action:{
                       self.selection = NavigationPushedAction.phoneNumberAction
                   }).clipped()
               }.padding(.top, 64)
               
           }
           Spacer()
       }).padding([.leading,.trailing],32)
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

struct ProfilePictureContoller_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePictureContoller()
    }
}
