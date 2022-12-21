//
//  SlotMachine.swift
//  Swift Slot Machine
//  Created by blaze  on 12/21/22.
//  Swift Slot Machine
//  Created by blaze Wheeler on 10/17/21.
//

import SwiftUI

struct SlotMachineView: View {
    
    @State private var symbols = ["apple", "star", "cherry"]
    @State private var numbers = Array(repeating: 0, count: 9)
    @State private var backgrounds = Array(repeating: Color.white, count: 9)
    @State private var credits = 1000
    @State private var win = false
    private var betAmount = 5
    
    var body: some View {
      
        
        ZStack{
           
        // Background
            Rectangle()
                .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
                .edgesIgnoringSafeArea(.top)
            
            Rectangle()
                .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255))
                .rotationEffect(Angle(degrees: 58))
                
            
            VStack{
                Spacer()
        // Title
                HStack{
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("SwiftUI Slots")
                        .bold()
                        .foregroundColor(.white)
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }.scaleEffect(2)
                Spacer()
        // Credits Counter
                Text("Credits: " + String(credits))
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(win ? Color.green.opacity(0.5) : Color.white.opacity(0.5))
                    .cornerRadius(30)
                    .scaleEffect(win ? 1.2 : 1)
                    .animation(.spring(response: 0.7, dampingFraction:0.3))
                   Spacer()
        // Cards
                VStack{
                    HStack{
                        Spacer()
                        CardView(symbol: $symbols[numbers[0]], background: $backgrounds[0])
                        CardView(symbol: $symbols[numbers[1]], background: $backgrounds[1])
                        CardView(symbol: $symbols[numbers[2]], background: $backgrounds[2])
                    }
                    HStack{
                        Spacer()
                        CardView(symbol: $symbols[numbers[3]], background: $backgrounds[3])
                        CardView(symbol: $symbols[numbers[4]], background: $backgrounds[4])
                        CardView(symbol: $symbols[numbers[5]], background: $backgrounds[5])
                    }
                    HStack{
                        Spacer()
                        CardView(symbol: $symbols[numbers[6]], background: $backgrounds[6])
                        CardView(symbol: $symbols[numbers[7]], background: $backgrounds[7])
                        CardView(symbol: $symbols[numbers[8]], background: $backgrounds[8])
                    }
                }
                    Spacer()
                
            // Buttons
                HStack( spacing: 20){
                    VStack{
                        Button(action: {
                            // Process A Single Spin
                            self.processResults()
                        }) {
                            Text("Spin")
                                .bold()
                                .foregroundColor(.white)
                                .padding(.all,10)
                                .padding([.leading,.trailing],30)
                                .background(Color.pink)
                                .cornerRadius(20)
                        }
                        Text("\(betAmount) Credits").padding(.top, 10).font(.footnote)
                    }
                    
                    
                    VStack{
                        Button(action: {
                            // Process A Single Spin
                            self.processResults(isMax: true)
                        }) {
                            Text("Max Spin")
                                .bold()
                                .foregroundColor(.white)
                                .padding(.all,10)
                                .padding([.leading,.trailing],30)
                                .background(Color.pink)
                                .cornerRadius(20)
                        }
                        Text("\(betAmount * 5) Credits").padding(.top, 10).font(.footnote)
                    }
                }
                Spacer()
            }
        }
        .animation(.easeOut)
    }
    
    
    
    func processResults( isMax:Bool = false){
        // resets bacground to white
        self.backgrounds =  self.backgrounds.map { _ in
            Color.white
        }
        
        if isMax {
            // Spin all the cards
            self.numbers = self.numbers.map({_ in
                Int.random(in: 0...self.symbols.count - 1)
            })
        } else {
            // Spin The Middle Row
            self.numbers[3] = Int.random(in: 0...self.symbols.count-1)
            self.numbers[4] = Int.random(in: 0...self.symbols.count-1)
            self.numbers[5] = Int.random(in: 0...self.symbols.count-1)
          
        }
        processWin(isMax: isMax)
    }
    
    func processWin( isMax:Bool = false){
        
        var matches = 0
        if !isMax{
            // processing for single spin
            if isMatch(index1: 3, index2: 4, index3: 5) {matches += 1}
        }
        else {
            // Procesing for max spin
            // Top Row
            if isMatch(index1: 0, index2: 1, index3: 2) {matches += 1}
            
         // Middle Row
            if isMatch(index1: 3, index2: 4, index3: 5) {matches += 1}
        
            // Bottom Row
            if isMatch(index1: 6, index2: 7, index3: 8) {matches += 1}
            
            // Diagnol Top Left To Bottom Right
            if isMatch(index1: 0, index2: 4, index3: 8) {matches += 1}
           
            // Diagonal Top Right To Bottem Left
            if isMatch(index1: 2, index2: 4, index3: 6) {matches += 1}
           
        }
        self.win = false
        
        // Check Matches And Distribute Credits
        if matches > 0 {
            // Atleast One Win
            self.credits += matches * betAmount * 2
            self.win = true
            
        }
        else if !isMax {
            // Zero wins, Single Spin
            self.credits -= betAmount
        }
        else {
            // Zero Wins, Max Spin
            self.credits -= betAmount * 5
        }
    }
    
    func isMatch( index1:Int, index2:Int, index3:Int ) ->
        Bool {
            if self.numbers[index1] == self.numbers[index2] &&
                self.numbers[index2] == self.numbers[index3] {
                
                self.backgrounds[index1] = Color.green
                self.backgrounds[index2] = Color.green
                self.backgrounds[index3] = Color.green
                
                return true
            }
            
        return false
    }
}

struct SlotMachineView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            
        }
    }
}


