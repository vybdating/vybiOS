//
//  PickerButtonView.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 23/11/2020.
//

import SwiftUI

struct PickerButtonView: View {
    
    //MARK: Properties
    var placeHolderText = ""
    var action: () -> Void
   
   //MARK: BODY
    var body: some View {
        Button(action: {
            self.action()
        }) {
            HStack(spacing: 0) {
                Text(self.placeHolderText)
                    .font(Font.robotoThin(size: 16))
                    .foregroundColor(Color.black)
                Spacer()
                Image("DownArrow")
                    .resizable()
                    .imageScale(.small)
                    .frame(width: 16, height: 16, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .scaledToFill()
                    .clipped()
         
            }.padding(16)
         //: BUTTON
        }.accentColor(.black)
        .foregroundColor(.black)
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
        
    }
}

struct PickerButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PickerButtonView(placeHolderText: "Select" ,action: {
            
        }).previewLayout(.sizeThatFits)
    }
}
