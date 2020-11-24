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
    
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var receivedImage: Image?

    func loadImage() {
        guard let inputImage = inputImage else { return }
        self.receivedImage = Image(uiImage: inputImage)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4, content: {
           Text("Profile Picture")
               .foregroundColor(.black)
               .font(Font.robotoBold(size: 30))
               
           Text("This is will be your only picture on Vyb.\nChoose carefully.")
               .foregroundColor(.gray)
               .font(Font.robotoThin(size: 15))
               .padding(.bottom, 32)
           
           VStack(alignment: .center, spacing: 16){
                    Button(action: {
                        self.showingImagePicker = true
                    }) {
                        ZStack{
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(Color.textFieldGrey, lineWidth: 0)
                                .shadow(color: .black, radius: 2, x: 0, y: 2)
                                .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .background(gradient)
                                .cornerRadius(50)
                            
                            ZStack{
                                
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.white, lineWidth: 4)
                                    .shadow(color: .white, radius: 0, x: 0, y: 0)
                                    .background(Color.primaryVybe)
                                    .cornerRadius(15)
                                    .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .clipped()
                                //: REC
                                
                                Image(systemName: "plus")
                                    .resizable()
                                    .scaledToFit()
                                    .imageScale(.small)
                                    .foregroundColor(Color.white)
                                    .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .clipped()
                                //: IMAGE
                                    
                            }.offset(x: 75, y: -30)
                            //: ZSTACK
                            
                            if (self.inputImage == nil){
                                 Image("UserProfile")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 120, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .cornerRadius(50)
                                    .clipped()
                            }
                            
                            if (self.inputImage != nil){
                                 Image(uiImage: self.inputImage!)
                                    .resizable()
                                    .renderingMode(.original)
                                    .scaledToFill()
                                    .frame(width: 120, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .cornerRadius(50)
                                    .clipped()
                            }
                        }
                    }

               NavigationLink(destination:  EmptyView(), tag: NavigationPushedAction.phoneNumberAction, selection: $selection) {
                   DefaultButton(title: "Next", action:{
                       self.selection = NavigationPushedAction.phoneNumberAction
                   }).clipped()
               }.padding(.top, 32)
               
           }
           Spacer()
       })
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(image: self.$inputImage)
        }
        .padding([.leading,.trailing],32)
        .navigationTitle("")
        .navigationBarTitle(Text(""))
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
}

struct ProfilePictureContoller_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePictureContoller()
    }
}
