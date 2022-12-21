//
//  WarGame.swift
//  Swift Slot Machine
//  Created by blaze  on 12/21/22.
//  ContentView.swift
//  Created by blaze  on 12/21/22.
//

import SwiftUI

struct WarGame: View {
    
    @State private var  randNum1 = 2
    @State private var  randNum2 = 2
    @State private var win1 = false
    @State private var win2 = false
    @State private var score1 = 0
    @State private var score2 = 0
    
    var body: some View {
        
        ZStack{
            Image("Background")
                .resizable()
                .edgesIgnoringSafeArea(.top)
            
            VStack {
              
                Image("logo")
                Spacer(minLength: 150)
                
                HStack{
                    Image("card" + String(randNum1))
                    Image("card" + String(randNum2))
                }
                
                Spacer(minLength: 60)
                
                Button {
                    //Randomize State Properties
                    self.randNum1 = Int.random(in: 2...14)
                    self.randNum2 = Int.random(in: 2...14)
                    
                    // Update Score Properties
                    if self.randNum1 > randNum2 {
                        processWin1(win1: false)
                    }
                    else if self.randNum2 > self.randNum1 {
                        processWin2(win2: false)
                    }
                } label: {
                    Image("dealbutton")
                    .renderingMode(.original)
                }
                
                Spacer()
                
                HStack {
                    VStack{
                        Spacer()
                        Text("Player : " + String(score1))
                            .foregroundColor(.black)
                            .padding(.all, 10)
                            .background(win1 ? Color.orange.opacity(1.0) : Color.white.opacity(0.5))
                            .cornerRadius(30)
                            .scaleEffect(win1 ? 1.2 : 1)
                            .animation(.spring(response: 0.7, dampingFraction:0.3))
                        Spacer()
                    }
                    // Leading: For Left Edge
                    .padding(.leading, 20)
                    
                    .foregroundColor(.white)
                    Spacer()
                    
                    VStack{
                        Spacer()
                        Text("CPU : " + String(score2))
                            .foregroundColor(.black)
                            .padding(.all, 10)
                            .background(win2 ? Color.green.opacity(0.5) : Color.white.opacity(0.5))
                            .cornerRadius(30)
                            .scaleEffect(win2 ? 1.2 : 1)
                            .animation(.spring(response: 0.7, dampingFraction:0.3))
                        Spacer()
                    }
                    
                    // Trailing: For Right Edge
                    .padding(.trailing, 20)
                    .padding(.bottom, 20)
                    .foregroundColor(.white)
                }
                Spacer()
            }
        }
    }
    
    func processWin1( win1 :Bool = false ){
        if self.randNum1 > randNum2 {
            let win1 = true
            if win1 == true {
                self.score1 += 1
            }
        }
    }
        
func processWin2( win2 :Bool = false ){
            
            if self.randNum1 < randNum2 {
                let win2 = true
                if win2 == true {
                    self.score2 += 1
            }
        }
    }
}

struct WarGame_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
