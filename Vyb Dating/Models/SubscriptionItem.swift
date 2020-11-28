//
//  SubscriptionItem.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 28/11/2020.
//

import SwiftUI


struct SubscriptionItem: Identifiable {
    var id: String
    var title: String
    var message: String
    var amountPerMonth: String
    var amountPerYear: String
    var currency: String = ""
}

extension SubscriptionItem {


    //MARK: init the
    init() {
        self.init(id: "12", title: "12 Months Premium", message: "Enter Room of your choice\n7 curated dates a day\n7 days ublimited communication", amountPerMonth: "19.99", amountPerYear: "44.99", currency: "$")
    }
}

