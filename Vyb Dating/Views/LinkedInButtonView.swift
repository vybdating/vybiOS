//
//  LinkedInButtonView.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 11/11/2020.
//

import SwiftUI

struct LinkedInButtonView: View {
    //MARK: - Properties
    private let action: () -> Void
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    //MARK: - Body
    var body: some View {
        Button(action:self.action) {
            HStack(spacing: 8) {
                Spacer()
                Image("LinkedIn")
                    .resizable()
                    .imageScale(.small)
                    .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .scaledToFill()
                    .clipped()
                Text("Connect With LinkedIn")
                Spacer()
            }.padding(16)
         //: BUTTON
        }.accentColor(.white)
        .foregroundColor(.white)
        .background(Color.primaryVybe)
        .cornerRadius(40)
        .overlay(
            RoundedRectangle(cornerRadius: 40)
                .stroke(Color.primaryVybe, lineWidth: 0)
                .shadow(color: .black, radius: 2, x: 0, y: 2)
    )
        .padding([.top, .bottom], 0)
        .font(Font.robotoRegular(size: 20))
    }
}

struct LinkedInButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LinkedInButtonView(action:{
            
        }).previewLayout(.sizeThatFits)
    }
}
