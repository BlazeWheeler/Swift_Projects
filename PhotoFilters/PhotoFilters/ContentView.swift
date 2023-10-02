//
//  ContentView.swift
//  PhotoFilters
//
//  Created by blaze  on 12/22/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            
            Home()
            
                //darkMode
                .navigationBarTitle("Filter")
                .preferredColorScheme(.dark)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
