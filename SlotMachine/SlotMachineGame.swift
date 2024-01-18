//
//  SlotMachineGame.swift
//  SlotMachine
//
//  Created by Koy Torres on 4/2/23.
// Model

import Foundation

struct SlotMachineGame {
    var slotWheels = 3
    var options: [SlotEmojis]
    var balance = 100
    
    func getBalance() -> Int {
        return balance
    }
    
    private func randomize(on: SlotEmojis) -> SlotEmojis {
        let randomShape = SlotEmojis.Shapes.all.randomElement()!
        let randomShade = SlotEmojis.Shades.all.randomElement()!
        let randomColor = SlotEmojis.Colors.all.randomElement()!
        
        return SlotEmojis(shape: randomShape, shade: randomShade, color: randomColor, id: on.id)
    }
        
    mutating func spinWheel() {
        if balance >= 5 {
            self.balance-=5
            
            options = [randomize(on: options[0]), randomize(on: options[1]), randomize(on: options[2])]

            if ((options[0].shape == options[1].shape && options[1].shape == options[2].shape) &&
                    (options[0].color == options[1].color && options[1].color == options[2].color) &&
                    (options[0].shade == options[1].shade && options[1].shade == options[2].shade)) ||
                ((options[0].shape != options[1].shape && options[1].shape != options[2].shape && options[0].shape != options[2].shape) &&
                    (options[0].color != options[1].color && options[1].color != options[2].color && options[0].color != options[2].color) &&
                    (options[0].shade != options[1].shade && options[1].shade != options[2].shade && options[0].shade != options[2].shade)) {
                self.balance += 25
            } else if ((options[0].shape == options[1].shape && options[1].shape == options[2].shape) &&
                        (options[0].color == options[1].color && options[1].color == options[2].color)) ||
                        ((options[0].shape == options[1].shape && options[1].shape == options[2].shape) &&
                            (options[0].shade == options[1].shade && options[1].shade == options[2].shade)) ||
                        ((options[0].color == options[1].color && options[1].color == options[2].color) &&
                            (options[0].shade == options[1].shade && options[1].shade == options[2].shade)) {
                self.balance += 5
            } else if ((options[0].shape != options[1].shape && options[1].shape != options[2].shape && options[0].shape != options[2].shape) &&
                        (options[0].color != options[1].color && options[1].color != options[2].color && options[0].color != options[2].color)) ||
                        ((options[0].shape != options[1].shape && options[1].shape != options[2].shape && options[0].shape != options[2].shape) &&
                            (options[0].shade != options[1].shade && options[1].shade != options[2].shade && options[0].shade != options[2].shade)) ||
                        ((options[0].color != options[1].color && options[1].color != options[2].color && options[0].color != options[2].color) &&
                            (options[0].shade != options[1].shade && options[1].shade != options[2].shade && options[0].shade != options[2].shade)) {
                self.balance += 5
            } else if ((options[0].shape == options[1].shape && options[1].shape == options[2].shape) ||
                        (options[0].color == options[1].color && options[1].color == options[2].color) ||
                        (options[0].shade == options[1].shade && options[1].shade == options[2].shade)) ||
                        ((options[0].shape != options[1].shape && options[1].shape != options[2].shape && options[0].shape != options[2].shape) ||
                            (options[0].color != options[1].color && options[1].color != options[2].color && options[0].color != options[2].color) ||
                            (options[0].shade != options[1].shade && options[1].shade != options[2].shade && options[0].shade != options[2].shade)) {
                self.balance += 1
            }
        } else {
            return
        }
    }
    
    init() {
        self.options = [SlotEmojis]()
        
        for index in 0..<slotWheels {
            options.append(SlotEmojis(shape: SlotEmojis.Shapes.all.randomElement()!, shade: SlotEmojis.Shades.all.randomElement()!, color: SlotEmojis.Colors.all.randomElement()!, id: index))
        }
    }

}
