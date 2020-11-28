//
//  Date+Extension.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 28/11/2020.
//

import Foundation


extension Date {
   
    //MARK: format date
    func getFormattedDate(format: String) -> String {
            let dateformat = DateFormatter()
            dateformat.dateFormat = format
            return dateformat.string(from: self)
    }
}
