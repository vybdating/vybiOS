//
//  GenericViewExtension.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 11/11/2020.
//

import SwiftUI


struct ImageOverlayText: View {
    private let title: String
    
    init(text: String) {
        self.title = text
    }
    
    var body: some View {
        ZStack {
            Text(self.title)
                .font(.callout)
                .padding(6)
                .foregroundColor(.white)
        }.background(Color.black)
        .opacity(0.8)
        .cornerRadius(10.0)
        .padding(6)
    }
}
