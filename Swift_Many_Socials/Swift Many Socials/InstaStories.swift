//-------------------------------------
//  InstaStories.swift
//  Swift Many Socials
//  Created by blaze Wheeler
//-------------------------------------
// Contains Story Content For Instagram()
//-------------------------------------

import SwiftUI

struct Story: View {
    var image: String = "marcZucker"
    var name: String = "Mark Z."
    
    var body: some View {
        VStack {
            VStack{
                Image(image)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .cornerRadius(50)
            }
            .overlay(
                Circle()
                    .stroke(LinearGradient(colors:
                    [.red, .purple, .red, .orange, .yellow,.orange],
                    startPoint: .topLeading,
                    endPoint: .bottomLeading),
                    lineWidth: 2.3)
                .frame(width: 68, height: 68)
            )
                    .frame(width: 70, height: 70)
                    Text(name)
                    .font(.caption)
        }
    }
}

struct Stories: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 15){
                Story()
                Story(image: "elon", name: "Elon Musk")
                Story(image: "jeffBezos", name: "Jeff Bezos")
                Story(image: "Tom", name: "Tom")
                Story(image: "steve", name: "Steve Jobs")
                Story(image: "billGates", name: "Bill Gates")
                Story(image: "jack", name: "Jack Dorsey")
                Story(image: "Tim", name: "Tim Cook")
                
            }
            .padding(.horizontal, 8)
        }
        .padding(.vertical, 10)
    }
}
