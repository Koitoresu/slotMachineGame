//
//  SlotMachineView.swift
//  SlotMachine
//
//  Created by Koy Torres on 4/1/23.
// View

import SwiftUI

struct SlotMachineView: View {
    
    @ObservedObject var slotMachineGame: SlotMachineGameView
    
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack {
                VStack {
                    Text("Balance: $\(slotMachineGame.getBalance())")
                        .font(.largeTitle)
                        .padding()
                    HStack {
                        ForEach(slotMachineGame.options) { symbol in
                            cardView(for: symbol)
                        }
                    }
                    .padding(5)
                    HStack {
                        newGame
                        Spacer()
                        spinWheel
                    }
                }
            }
        })
    }
    
    var newGame: some View {
        Button {
            slotMachineGame.newGame()
        } label: {
            VStack {
                Image(systemName: "arrowtriangle.right.circle")
                    .imageScale(.large)
                    .font(.largeTitle)
                Text("New Game")
                    .font(.caption)
            }
            .padding()
        }
    }
    
    var spinWheel: some View {
        Button {
            slotMachineGame.spinWheel()
        } label: {
            VStack {
                Image(systemName: "arrow.triangle.2.circlepath")
                    .imageScale(.large)
                    .font(.largeTitle)
                Text("Spin")
                    .font(.caption)
            }
            .padding()
        }
        .disabled(slotMachineGame.getBalance() < 5)
    }
    
    @ViewBuilder
    private func cardView(for card: SlotEmojis) -> some View {
        CardView(card)
    }
}

struct CardView: View {
    private let option: SlotEmojis
    private let emojiColor: Color
    
    init(_ option: SlotEmojis) {
        self.option = option
        
        switch option.color {
        case .red:
            emojiColor = Color.red
        case .blue:
            emojiColor = Color.blue
        case .green:
            emojiColor = Color.green
        case .purple:
            emojiColor = Color.purple
        }
    }
    
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack {
                let roundedRect = RoundedRectangle(cornerRadius: 10)
                roundedRect.fill()
                    .foregroundColor(.white)
                roundedRect.stroke(lineWidth: 5)
                    .aspectRatio(1/1, contentMode: .fit)
                if option.shade == .shaded {
                    Text(option.getCardContent())
                        .opacity(0.5)
                        .foregroundColor(emojiColor)
                } else {
                    Text(option.getCardContent())
                        .foregroundColor(emojiColor)
                }
            }
            .font(Font.system(size: drawingConstants.fontSize))
        })
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.height, size.width) * drawingConstants.fontScale)
    }
    
    private struct drawingConstants {
        static let fontScale: CGFloat = 0.65
        static let fontSize: CGFloat = 125
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SlotMachineGameView()
        SlotMachineView(slotMachineGame: game)
    }
}
