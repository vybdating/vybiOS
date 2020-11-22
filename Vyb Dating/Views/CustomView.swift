//
//  CustomView.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 21/11/2020.
//

import SwiftUI

struct BackIconView: View {
    var body: some View {
        Image("NavigationBack")
            .resizable()
            .imageScale(.large)
            .scaledToFit()
            .frame(width: 24, height: 24, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .clipped()
    }
}

struct CustomView_Previews: PreviewProvider {
    static var previews: some View {
        BackIconView()
    }
}
