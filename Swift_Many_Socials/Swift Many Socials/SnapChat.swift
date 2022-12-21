//-------------------------------------
// SnapChat.swift
//  Swift Many Socials
//  Created by blaze Wheeler
//-------------------------------------
// Snapchat UI View
//-------------------------------------

import SwiftUI

struct SnapChat: View {
    var body: some View {
       
        
        VStack(spacing: 0) {
            Snap_ChatHeader()
            ScrollView {
                    Divider()
                    HStack(spacing: 0)
                    {
                        VStack(spacing:10) {
                            ForEach(0 ..< 4) { item in
                                
                                bitmojiImage(bitmojiImage: "Susan")

                                bitmojiImage(bitmojiImage: "Vijaya")
                                bitmojiImage(bitmojiImage: "emoji6")
                                }
                            
                            }
                        VStack(spacing: 15) {
                            
                            ForEach(0 ..< 4) { item in
                             
                                snap_Chat_Text(nameOfUser: "Susan", image: "Opened2", msgStatus: "Opened", streak: "99")
                               
                                snap_Chat_Text(nameOfUser: "Vijaya", image: "openedBlue", msgStatus: "Tap to view", streak: "67")
                                
                                snap_Chat_Text(nameOfUser: "Darren", image: "Rectangle13", msgStatus: "Tap to view", streak: "22")
                        }
                    }
                }
            }
        }
    }
}


struct SnapChat_Previews: PreviewProvider {
    static var previews: some View {
        SnapChat()
.previewInterfaceOrientation(.portrait)
    }
}

struct bitmojiImage: View {
    var bitmojiImage: String
    var body: some View{
        
        Image(bitmojiImage)
            .resizable()
            .scaledToFit()
            .frame(width: 70, height: 80)
            .frame(width: .infinity, alignment: .leading)
       
      
    }
}

struct snap_Chat_Text: View {
    var nameOfUser: String
    var image: String
    var msgStatus: String
    var streak: String
    
    var body: some View {
        HStack {
            VStack(spacing: 15) {
                HStack {
                    Text(nameOfUser)
                        .fontWeight(.heavy)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                HStack {
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .frame(width: .infinity, alignment: .leading)
                    
                  
                        Text("•\(msgStatus) • 1hr • \(streak) 🔥 ")
                            .foregroundColor(.gray)
                            .frame(width: .infinity, alignment: .leading)
                    Spacer()
                    Rectangle()
                        .frame(width: 1, height: 20)
                        .foregroundColor(.gray)
                   
                    Image("snapchatMessage")
                        .padding(.horizontal)
                }
               
                Divider()
            }
            Divider()
        }
        
    }
}

struct Snap_ChatHeader: View {
    var body: some View {
        HStack{
            Image("avatar")
            Image("Search")
            Spacer()
            Text("Chat")
                .font(.title)
                .fontWeight(.heavy)
                .padding(.horizontal)
            Spacer()
                
            HStack(spacing: 20.0){
                Image("addFriend")
                Image("Newchat")
               
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 3)
    }
    
}
