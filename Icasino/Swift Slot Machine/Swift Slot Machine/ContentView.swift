//
//  ContentView.swift
//  Created by blaze Wheeler on 10/17/21.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        
        tab_BarView()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      
            ContentView()
            
        
    }
}
    
    struct tab_BarView: View {
        var body: some View {
            TabView {
                SlotMachineView()
                    .tabItem {
                        Image("slotmachine.SFSymbol")
                            .resizable()
                        Text("Slot Machine")
                    }
                WarGame()
                    .tabItem {
                        Image("war.SFSymbol")
                            .resizable()
                            .foregroundColor(.gray)
                        
                        
                        Text("War Game")
                    }
                
                
            }
            .onAppear() {
                UITabBar.appearance().barTintColor = .red
                
            }
        }
    }
    
    


