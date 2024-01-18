//
//  SlotMachineGameView.swift
//  SlotMachine
//
//  Created by Koy Torres on 4/2/23.
// View Model

import SwiftUI

class SlotMachineGameView: ObservableObject {
        
    @Published private var game: SlotMachineGame
        
    private static func createSlotMachine() -> SlotMachineGame {
        SlotMachineGame()
    }
    
    var options: Array<SlotEmojis> {
        return game.options // returns the options
    }
     
    func newGame() {
        game = SlotMachineGameView.createSlotMachine()
    }
    
    //intent
    func spinWheel() {
        game.spinWheel()
    }
    
    func getBalance() -> Int {
        return game.getBalance()
    }
    
    init() {
        game = SlotMachineGameView.createSlotMachine()
    }

}
