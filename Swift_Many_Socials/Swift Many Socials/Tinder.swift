//-------------------------------------
// Tinder.swift
//  Swift Many Socials
//  Created by blaze Wheeler
//-------------------------------------
// Tinder UI View
//-------------------------------------
import SwiftUI

struct Tinder: View {
    var body: some View {
        VStack {
            //Top Stack
            HStack {
                Button(action:{}) {
                    Image("profile")
                }
                Spacer()
                Button(action:{}) {
                Image("tinder-icon").resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 45)
                }
                Spacer()
                Button(action: {}) {
                Image("chats")
                }
        }.padding(.horizontal)
            
        //Card
            
            ZStack {
                ForEach(Card.data.reversed()) { card in
                    CardView(card: card).padding(8)
                }
            }.zIndex(1.0)
        //Bottom Stack
            
        HStack(spacing:0) {
                Button(action:{})
                {
                    Image("refresh")
                }
                Button(action:{})
                {
                    Image("dismiss")
                }
                Button(action:{})
                {
                    Image("super_like")
                }
                Button(action:{})
                {
                    Image("like")
                }
                Button(action:{})
                {
                    Image("boost")
                }
            }
        }
    }
}

struct Tinder_Previews: PreviewProvider {
    static var previews: some View {
        Tinder()
    }
}

struct CardView: View {
    @State var card: Card
    let cardGradient = Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.5)])
    var body: some View {
        ZStack(alignment:.topLeading) {
            Image(card.imageName).resizable()
            LinearGradient(gradient: cardGradient, startPoint: .top, endPoint: .bottom)
            VStack {
                Spacer()
                VStack(alignment: .leading){
                    HStack {
                        Text(card.name).font(.largeTitle).fontWeight(.bold)
                        Text(String(card.age)).font(.title)
                    }
                    Text(card.bio)
                }
            }
            .padding()
            .foregroundColor(.white)
            
            // LIKE & NOPE Cards
            HStack {
                Image("yes")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
                    .opacity(Double(card.x/10 - 1))
                Spacer()
                Image("nope")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
                    .opacity(Double(card.x * -1 - 1))
                
        }
    }
        .cornerRadius(8)
        // Step 1 - Zstack Follows The Coordinate Of The Card Model
        
        .offset(x: card.x, y: card.y)
        .rotationEffect(.init(degrees: card.degree))
        
        // Step 2 - Gesture Recognniser Updates The Coordinate Values Of The Card Model
        .gesture(
            DragGesture()
                .onChanged { value in
                    // User Drag View
                    card.x = value.translation.width
                    card.y = value.translation.height
                    card.degree = 7 * (value.translation.width > 0 ? 1 : -1)
                }
                .onEnded { value in
                    // Do When User Stops Dragging
                    withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 50, damping: 8, initialVelocity: 0)) {
                        switch value.translation.width {
                            case 0...100:
                            card.x = 0; card.degree = 0; card.y = 0
                            case let x where x > 100:
                                card.x = 500; card.degree = 12
                            case (-100)...(-1):
                                card.x = 0; card.degree = 0; card.y = 0;
                            case let x where x < -100:
                                card.x = -500; card.degree = -12
                            default: card.x = 0; card.y = 0
                            
                    }
                }
            }
        )
    }
}
