//
//  PickerInputView.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 12/11/2020.
//

import SwiftUI

struct PickerInputView: View {
     var placeText: String = "Height"
     private var selection: (String) -> Void
    @State private var showingActionSheet = false
   
    //MARK: init this action
    init(placeHolder: String, selection: @escaping (String) -> Void) {
        self.placeText = placeHolder
        self.selection = selection
    }
    
    var body: some View {
        Button(action: {
            self.showingActionSheet = true
        }) {
            HStack(spacing: 8) {
                Text(self.placeText)
                Spacer()
                Image("DownArrow")
                    .resizable()
                    .imageScale(.small)
                    .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .scaledToFill()
                    .clipped()
         
            }.padding(16)
         //: BUTTON
        }.accentColor(.black)
        .foregroundColor(.black)
        .background(Color.textFieldGrey)
        .cornerRadius(40)
        .overlay(
            RoundedRectangle(cornerRadius: 40)
                .stroke(Color.textFieldGrey, lineWidth: 0)
                .shadow(color: .black, radius: 2, x: 0, y: 2)
    )
        .padding([.top, .bottom], 0)
        .font(Font.system(size: 19, weight: .semibold))
        .actionSheet(isPresented: $showingActionSheet) {
            ActionSheet(title: Text("Vyb Action"), message: Text("Select Action"), buttons: [
                .default(Text("Fight")) {
                    self.selection("Fight")
                },
                .default(Text("Flight")) {
                    self.selection("Flight")
                },
                .default(Text("False Alarm")) {
                    self.selection("False Alarm")
                },
            ])
            }
    }
}

struct PickerInputView_Previews: PreviewProvider {
    static var previews: some View {
        PickerInputView(placeHolder: "Height", selection: {_ in
            
        } ).previewLayout(.sizeThatFits)
    }
}
