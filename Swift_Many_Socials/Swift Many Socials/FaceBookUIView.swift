//-------------------------------------
// FaceBookUI.swift
//  Swift Many Socials
//  Created by blaze Wheeler
//-------------------------------------
// Facebook UI Contents
//-------------------------------------

import Foundation
import SwiftUI


struct Facebook_Header: View {
    
    var body: some View {
        HStack {
            Image("logoFB")
                .resizable()
                .scaledToFit()
            .frame(width: 150, height: 60)
            Spacer()
            Image(systemName: "magnifyingglass")
                .font(.system(size: 18))
                .padding(8)
                .background(secondary)
                .clipShape(Circle())
            Image(systemName: "message.fill")
                .font(.system(size: 18))
                .padding(8)
                .background(secondary)
                .clipShape(Circle())
        }
        .padding(.horizontal)
    }
}

struct Create_FBPost: View {
    
    var body: some View {
        VStack {
            HStack {
                Image("marcZucker")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                Text("What's on your mind?")
                Spacer()
            }
            .padding(.horizontal)
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: 1)
                .foregroundColor(secondary)
            
            HStack {
                Spacer()
                HStack {
                    Image(systemName: "video.fill")
                        .foregroundColor(.red)
                    Text("Live")
                }
                Spacer()
                Rectangle()
                    .frame(width: 1, height: 20)
                    .foregroundColor(secondary)
                Spacer()
                HStack {
                    Image(systemName: "video.fill")
                        .foregroundColor(.green)
                    Text("Photo")
                }
                Spacer()
                Rectangle()
                    .frame(width: 1, height: 20)
                    .foregroundColor(secondary)
               
                Spacer()
                Group {
                    HStack {
                        Image(systemName: "video.fill")
                            .foregroundColor(.purple)
                        Text("Room")
                    }
                    Spacer()
                }
            }
            .font(.system(size: 14, weight: .semibold))
        }
    }
}

struct H_Divider: View {
    var body: some View {
        Rectangle()
            .frame(width: UIScreen.main.bounds.width, height: 6)
            .foregroundColor(ternary)
    }
}

struct MyStoryCard: View {
    var body: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 100, height: 170)
                .foregroundColor(secondary)
            
            ZStack(alignment: .bottom) {
                Image("marcZucker")
                    .resizable()
                    .frame(width: 100, height: 110)
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                VStack(spacing: 0) {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .padding(5)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .font(.system(size: 20, weight: .bold))
                        .overlay(Circle().stroke(secondary, lineWidth: 3))
                    Group {
                        Text("Create")
                        Text("story")
                    }
                    .font(.system(size: 12, weight: .semibold))
                }
                .offset(y: 45)
            }
        }
    }
}

struct FB_StoryCard: View {
    let imageName: String
    let profilePic: String
    let title: String
    
    
    var body: some View {
        ZStack(alignment: .leading) {
            Image(imageName)
                .resizable()
                .frame(width: 100, height: 170)
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 15))
            
            VStack(alignment: .leading, spacing: 100){
                Image(profilePic)
                    .resizable()
                    .frame(width: 35, height: 35)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle().stroke(Color.blue, lineWidth: 4))
                
                Text(title)
                    .font(.system(size: 12, weight: .semibold))
            }
            .padding(.leading, 8)
                
                
            
        }
    }
}



struct FB_StoryFeed: View {
    let titles = ["Tracy", "Jeff", "Steve", "Alex"]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                MyStoryCard()
                ForEach(1..<5) { i in
                   FB_StoryCard(imageName: "story\(i)", profilePic: "person\(i)", title: titles[i-1])
                }
            }
            .padding(.leading)
            .padding(.vertical, 5)
        }
    }
}

struct FB_Post_UI: View {
    var body: some View {
        VStack {
            HStack{
                Image("steve")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: 0) {
                    HStack{
                        Text("Steve Jobs")
                            .font(.system(size: 14, weight: .semibold))
                        Image(systemName: "checkmark")
                            .font(.system(size: 8, weight: .bold))
                            .padding(2)
                            .background(Color.blue)
                            .clipShape(Circle())
                    }
                    HStack(spacing: 5) {
                        HStack(spacing: 5){
                            Text("1 d")
                            Circle()
                                .frame(width: 2, height: 2)
                            Image(systemName: "globe")
                        }
                    }
                    .font(.system(size: 12))
                    .foregroundColor(lightGray)
                }
                Spacer()
                Image(systemName: "ellipsis")
                    .foregroundColor(lightGray)
            }
            .padding(.horizontal)
            
            Text("WWDC21 on the way this year with great new tweaks and features for SwiftUI 3.0 <3")
                .padding(.horizontal)
                .font(.system(size: 14))
            Image("wwdc")
                .resizable()
                .scaledToFit()
            
            HStack {
                HStack(spacing: 3) {
                    Image("icons")
                        .resizable()
                        .frame(width: 35, height: 18)
                    Text("155k")
                }
                Spacer()
                HStack {
                    Text("12k comments")
                    Text("3k shares")
                    Image("profilePic")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    Image(systemName: "arrowtriangle.down.fill")
                }
            }
            .foregroundColor(lightGray)
            .font(.system(size: 12))
            .padding(.horizontal)
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width - 15, height: 0.3)
            HStack {
                HStack {
                    Image(systemName: "hand.thumbsup")
                    Text("Like")
                }
                Spacer()
                
                HStack {
                    Image(systemName: "message")
                    Text("Comment")
                }
                
                Spacer()
                
                HStack {
                    Image(systemName: "arrowshape.turn.up.right")
                    Text("Share")
                }
            }
            .foregroundColor(lightGray)
            .font(.system(size: 14))
            .padding(.horizontal)
        }
    }
}

struct FB_Post_UIFeed: View {
    var body: some View {
        VStack {
            ForEach(1..<5){ i in
                FB_Post_UI()
                H_Divider()
                
            }
        }
    }
}

