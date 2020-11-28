//
//  SubscriptionViewModel.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 28/11/2020.
//

import SwiftUI

protocol SubscriptionViewModelProtocol {
    //MARK: - PROTOCOL DEFINITIONS
    var  allPlans: [SubscriptionItem] {get}
}

final class SubscriptionViewModel : SubscriptionViewModelProtocol, ObservableObject {
    //MARK: - PROPERTIES
    @Published var allPlans: [SubscriptionItem] = []

    init() {
        self.allPlans.append(SubscriptionItem())
        self.allPlans.append(SubscriptionItem())
        self.allPlans.append(SubscriptionItem())
        self.allPlans.append(SubscriptionItem())
    }
}
