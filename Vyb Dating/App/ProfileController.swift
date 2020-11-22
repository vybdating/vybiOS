//
//  ProfileController.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 12/11/2020.
//

import SwiftUI

struct ProfileController: View {
    //MARK: Properties
    @State var selection: NavigationPushedAction? = nil
    @State var showAlert = false
    @State var showHeightPicker = false
    @State var alertMessage = "Something went wrong, Try again."
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var feetSelected = 5
    @State var inchSelected = 5
    let bodyTypes = ["Ectomorphs","Endomorphs","Mesomorphs"]
    
    //MARK: 
    var heightPickerFeet: some View {
        HStack{
            Picker(selection: $feetSelected, label: Text("Feet")) {
                   ForEach(0..<10) {
                     Text("\($0)").tag($0)
                    }
            }.labelsHidden()
            .clipped()
            Spacer()
            Picker(selection: $inchSelected, label: Text("Inch")) {
                ForEach(0..<10) {
                  Text("\($0)").tag($0)
                 }
            }.labelsHidden()
            .clipped()
        }
        
    }
    
    //MARK: Body
    var body: some View {
         VStack(alignment: .leading, spacing: 4, content: {
            Text("Profile")
                .foregroundColor(.black)
                .font(Font.robotoBold(size: 30))
                
            Text("we dont share your information with anyone.")
                .foregroundColor(.gray)
                .font(Font.robotoThin(size: 15))
                .padding(.bottom, 32)
            
            VStack(alignment: .leading, spacing: 16){
                Button(action: {
                    self.showHeightPicker = true
                }, label: {
                    HStack(spacing: 0) {
                        Text("Height")
                            .font(Font.robotoThin(size: 16))
                            .foregroundColor(Color.black )
                        Spacer()
                        Image("DownArrow")
                            .resizable()
                            .imageScale(.small)
                            .frame(width: 16, height: 16, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .scaledToFill()
                            .clipped()
                 
                    }.padding(16)
                }).foregroundColor(.black)
                .background(RoundedRectangle(cornerRadius: 44)
                                .stroke(Color.textFieldGrey, lineWidth: 0)
                                .shadow(color: .black, radius: 2, x: 0, y: 2)
                                .frame(width: .infinity, height: 44, alignment: .leading)
                                .background(Color.textFieldGrey)
                                .cornerRadius(44))
                .cornerRadius(22)
                .padding([.top, .bottom], 0)
                .font(Font.system(size: 19, weight: .semibold))
                .frame(width: .infinity, height: 44, alignment: .leading)
                .clipped()
               
                PickerInputView(placeHolder: "Body Type", options: self.bodyTypes, selection: { selected in
                    print("SELECTED \(selected)")
                })
                
                NavigationLink(destination:  EmptyView(), tag: NavigationPushedAction.phoneNumberAction, selection: $selection) {
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
                        BackIconView()
                     }
             ).alert(isPresented: $showAlert) { () -> Alert in
                 Alert(title: Text(Constants.displayName), message: Text("\(alertMessage)"))
             }.sheet(isPresented: $showHeightPicker, content: {
                self.heightPickerFeet
            })
      
    }
}

struct ProfileController_Previews: PreviewProvider {
    static var previews: some View {
        ProfileController()
    }
}
