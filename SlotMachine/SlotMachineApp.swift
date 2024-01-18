//
//  SlotMachineApp.swift
//  SlotMachine
//
//  Created by Koy Torres on 4/1/23.
//

import SwiftUI

@main
struct SlotMachineApp: App {
    let game = SlotMachineGameView()
    
    var body: some Scene {
        WindowGroup{
            SlotMachineView(slotMachineGame: game)
        }
    }
}
