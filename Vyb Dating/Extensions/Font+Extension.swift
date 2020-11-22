//
//  Font+Extension.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 22/11/2020.
//

import SwiftUI


extension Font {
   
  static func robotoRegular(size: CGFloat) -> Font {
    return Font.custom(FontName.Regular.rawValue, size: size)
  }
    
    static func robotoBlack(size: CGFloat) -> Font {
     return Font.custom(FontName.Black.rawValue, size: size)
   }
    
    static func robotoBold(size: CGFloat) -> Font {
       return Font.custom(FontName.Bold.rawValue, size: size)
    }
    
    static func robotoMedium(size: CGFloat) -> Font {
        return Font.custom(FontName.Medium.rawValue, size: size)
    }

    static func robotoThin(size: CGFloat) -> Font {
         return Font.custom(FontName.Thin.rawValue, size: size)
     }
    
    static func robotLight(size: CGFloat) -> Font {
         return Font.custom(FontName.Light.rawValue, size: size)
    }
}
