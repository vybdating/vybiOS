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
    
    func makeBody(configuration: Self.Configuration) -> some View {
        let currentForegroundColor = isDisabled || configuration.isPressed ? foregroundColor.opacity(0.9) : foregroundColor
        
       let gradient = LinearGradient(gradient: Gradient(colors: [backgroundStartColor,backgroundEndColor]), startPoint: .leading, endPoint: .trailing)
        
        let gradientPressed = LinearGradient(gradient: Gradient(colors: [backgroundStartColor.opacity(0.9),backgroundEndColor.opacity(0.9)]), startPoint: .leading, endPoint: .trailing)
        
        return configuration.label
            .padding()
            .foregroundColor(currentForegroundColor)
            .background(isDisabled || configuration.isPressed ? gradientPressed : gradient)
            // This is the key part, we are using both an overlay as well as cornerRadius
            .cornerRadius(40)
            .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(currentForegroundColor, lineWidth: 0)
                    .shadow(color: .black, radius: 2, x: 0, y: 2)
        )
            .padding([.top, .bottom], 0)
            .font(Font.system(size: 20, weight: .bold))
    }
}

struct DefaultButton: View {
    //MARK: Properties
    private static let buttonHorizontalMargins: CGFloat = 40
    var backgroundStartColor: Color
    var backgroundEndColor: Color
    var foregroundColor: Color
    private let title: String
    private let action: () -> Void
    // It would be nice to make this into a binding.
    private let disabled: Bool
    
    init(title: String,
         disabled: Bool = false,
         backgroundStartColor: Color = Color.vybDeepGreen,
         backgroundEndColor: Color = Color.primaryVybe,
         foregroundColor: Color = Color.white,
         action: @escaping () -> Void) {
        self.backgroundStartColor = backgroundStartColor
        self.backgroundEndColor = backgroundEndColor
        self.foregroundColor = foregroundColor
        self.title = title
        self.action = action
        self.disabled = disabled
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
                                          isDisabled: disabled))
                .disabled(self.disabled)
           
        }
    }
}


struct DefaultButton_Previews: PreviewProvider {
    static var previews: some View {
        DefaultButton(title: "Get Started", action:{
            
        }).previewLayout(.sizeThatFits)
    }
}
