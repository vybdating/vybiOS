//
//  RoomViewModel.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 25/11/2020.
//

import SwiftUI

protocol RoomViewModelProtocol {
    //MARK: - PROTOCOL DEFINITIONS
    var roomList: [RoomItem] {get}
    func addNewRoom(room: RoomItem)
    func deleteRoom(room: RoomItem)
}

final class RoomViewModel : RoomViewModelProtocol, ObservableObject {
   
    //MARK: - PROPERTIES
    @Published var roomList: [RoomItem] = []

    init() {
        self.roomList.append(RoomItem())
        self.roomList.append(RoomItem())
        self.roomList.append(RoomItem())
        self.roomList.append(RoomItem())
        self.roomList.append(RoomItem())
        self.roomList.append(RoomItem())
    }
}

extension RoomViewModel {
    //MARK: - Functions implementations

    //MARK: add new room item
    func addNewRoom(room: RoomItem) {
        roomList.append(room)
    }
    
    //MARK: delete room item
    func deleteRoom(room: RoomItem) {
       
    }
}
