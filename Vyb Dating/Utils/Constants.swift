//
//  Constants.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 12/11/2020.
//

import SwiftUI

class Constants {
    static let displayName: String = "Vyb Dating"
    static let tagLine: String = "Stop swiping and put your personality first. Feel the Vyb."
}

enum FontName: String {
    case Black = "Roboto-Black"
    case BlackItalic = "Roboto-BlackItalic"
    case Italic = "Roboto-Italic"
    case BoldItalic = "Roboto-BoldItalic"
    case Light = "Roboto-BoldLight"
    case Medium = "Roboto-Medium"
    case MediumItalic = "Roboto-MediumItalic"
    case Regular = "Roboto-Regular"
    case Thin = "Roboto-Thin"
    case Bold = "Roboto-Bold"
    case ThinItalic = "Roboto-ThinItalic"
    
    func of(size: CGFloat) -> Font {
        return Font.custom(self.rawValue, size: size)
    }
}

enum NavigationPushedAction: Int {
    case phoneNumberAction
    case linkedInAction
    case phoneNumberVerificationAction
}

