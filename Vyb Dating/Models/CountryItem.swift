//
//  CountryItem.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 21/11/2020.
//

import SwiftUI


struct CountryItem: Identifiable {
    var id: String
    var name: String
    var code: String
    var imageName: String
}

extension CountryItem {


    func dummyCountr() -> Self {
        return CountryItem(id: "233", name: "Ghana", code: "233", imageName: "GH")
    }
}
