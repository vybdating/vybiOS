//
//  String+Extension.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 12/11/2020.
//

import SwiftUI
import PhoneNumberKit

extension String {
    
    //MARK: convert to flag
    func toEmoji() -> String {
        let base : UInt32 = 127397
        var s = ""
        for v in self.unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return String(s)
    }
    
    //MARK: number with code
    func formatNumber() -> String  {
        let phoneNumberKit = PhoneNumberKit()
        do {
            let parsedNumber = try phoneNumberKit.parse(self)
            return phoneNumberKit.format(parsedNumber, toType: PhoneNumberFormat.international)
        }
        catch {
            print("Generic parser error")
        }
        
        return ""
    }
}
