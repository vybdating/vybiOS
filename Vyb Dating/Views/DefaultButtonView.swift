//
//  DefaultButton.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 11/11/2020.
//

import SwiftUI

struct DefaultButtonStyle: ButtonStyle {
    let backgroundStartColor: Color
    let backgroundEndColor: Color
    let foregroundColor: Color
    let isDisabled: Bool
    let font: Font
    let buttonHeight: CGFloat
    
    func makeBody(configuration: Self.Configuration) -> some View {
        let currentForegroundColor = isDisabled || configuration.isPressed ? foregroundColor.opacity(0.9) : foregroundColor
        
       let gradient = LinearGradient(gradient: Gradient(colors: [backgroundStartColor,backgroundEndColor]), startPoint: .leading, endPoint: .trailing)
        
        let gradientPressed = LinearGradient(gradient: Gradient(colors: [backgroundStartColor.opacity(0.9),backgroundEndColor.opacity(0.9)]), startPoint: .leading, endPoint: .trailing)
        
        return configuration.label
            .padding()
            .foregroundColor(currentForegroundColor)
            .background(isDisabled || configuration.isPressed ? gradientPressed : gradient)
            .cornerRadius(buttonHeight)
            .overlay(
                RoundedRectangle(cornerRadius: buttonHeight)
                    .stroke(currentForegroundColor, lineWidth: 0)
                    .shadow(color: .black, radius: 2, x: 0, y: 2)
            )
            .padding([.top, .bottom], 0)
            .font(font)
    }
}

struct DefaultButton: View {
    //MARK: Properties
    var backgroundStartColor: Color
    var backgroundEndColor: Color
    var foregroundColor: Color
    private let title: String
    private let action: () -> Void
    private let disabled: Bool
    private let font: Font
    private var buttonHeight: CGFloat
    
    init(title: String,
         disabled: Bool = false,
         backgroundStartColor: Color = Color.vybDeepGreen,
         backgroundEndColor: Color = Color.primaryVybe,
         foregroundColor: Color = Color.white,
         font: Font = Font.robotoRegular(size: 20),
         buttonHeight: CGFloat = 44,
         action: @escaping () -> Void) {
        self.backgroundStartColor = backgroundStartColor
        self.backgroundEndColor = backgroundEndColor
        self.foregroundColor = foregroundColor
        self.title = title
        self.action = action
        self.disabled = disabled
        self.font = font
        self.buttonHeight = buttonHeight
    }
    
    //MARK: Body
    var body: some View {
        HStack {
            Button(action:self.action) {
                Text(self.title)
                    .frame(maxWidth:.infinity)
            }
            .accentColor(.white)
            //: BUTTON
            .buttonStyle(DefaultButtonStyle(backgroundStartColor: backgroundStartColor, backgroundEndColor: backgroundEndColor,
                                          foregroundColor: foregroundColor,
                                          isDisabled: disabled, font: font, buttonHeight: buttonHeight))
                .disabled(self.disabled)
            .clipped()
           
        }
    }
}


struct DefaultButton_Previews: PreviewProvider {
    static var previews: some View {
        DefaultButton(title: "Get Started", action:{
            
        }).previewLayout(.sizeThatFits)
    }
}
