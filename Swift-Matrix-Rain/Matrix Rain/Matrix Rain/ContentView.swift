//
//  ContentView.swift
//  Matrix Rain
//
//  Created by blaze Wheeler on 2/6/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.black
            MatrixRainActivity()
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
