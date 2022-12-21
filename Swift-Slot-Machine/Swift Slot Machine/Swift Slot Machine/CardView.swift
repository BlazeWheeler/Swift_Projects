//
//  CardView.swift
//  Swift Slot Machine
//
//  Created by blaze Wheeler on 11/27/21.
//

import SwiftUI

struct CardView: View {
    
    @Binding var symbol:String
    @Binding var background:Color
    
    private let transition: AnyTransition = AnyTransition.move(edge: .top)
    
    
    var body: some View {
        VStack{
            if symbol == "apple"{
                Image(symbol)
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .transition(transition)
                    
            } else if symbol == "cherry" {
                Image(symbol)
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .transition(transition)
            } else { 
                Image(symbol)
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .transition(transition)
            }
        }
        .background(background.opacity(0.5))
        .cornerRadius(20)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(symbol: Binding.constant("cherry"), background: Binding.constant(Color.green))
    }
}
