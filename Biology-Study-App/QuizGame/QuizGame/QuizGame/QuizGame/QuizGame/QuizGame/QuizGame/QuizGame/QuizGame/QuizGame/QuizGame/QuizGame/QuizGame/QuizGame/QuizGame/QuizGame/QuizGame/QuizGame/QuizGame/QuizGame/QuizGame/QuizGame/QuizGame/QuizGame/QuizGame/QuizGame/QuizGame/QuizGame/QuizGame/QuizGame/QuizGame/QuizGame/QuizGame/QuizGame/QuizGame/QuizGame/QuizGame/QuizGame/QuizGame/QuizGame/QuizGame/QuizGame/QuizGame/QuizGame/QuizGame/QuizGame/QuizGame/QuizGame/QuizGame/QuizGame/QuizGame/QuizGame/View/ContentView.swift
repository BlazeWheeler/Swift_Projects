//
//  ContentView.swift
//  QuizGame
//
//  Created by blaze Wheeler on 2/18/22.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var selection = 0
        
    var body: some View {
        TabView(selection: $selection) {
            
        
            BioBot()
            //Tab 1
            .tabItem {
                VStack{
                    Image(systemName: "message.fill")
                        .resizable()
                        .foregroundColor(.white)
                }
            }
            .tag(0)

            Home()
            // Tab One
           
             .tabItem {
                 VStack{
                     Image(systemName: "gamecontroller.fill")
                         .resizable()
                 }
                 
             }
             .tag(1)
        }
        .accentColor(Color("Pink"))
       
        
    }
        
}


extension UITabBarController {
    override open func viewDidLoad() {
        let standardAppearance = UITabBarAppearance()
        
        tabBar.standardAppearance = standardAppearance
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



              
