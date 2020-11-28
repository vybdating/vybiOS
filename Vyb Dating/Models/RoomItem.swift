//
//  RoomItem.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 25/11/2020.
//

import SwiftUI


struct RoomItem: Identifiable {
    var id: String
    var name: String
    var height: String
    var profession: String
    var imageName: String
    var location: String = ""
}

extension RoomItem {


    //MARK: init the
    init() {
        self.init(id: "2", name: "Bright Ahedor", height: "5'3''", profession: "Lecturer", imageName: "Background",location: "NYC")
    }
}

