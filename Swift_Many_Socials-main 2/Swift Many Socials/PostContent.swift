//-------------------------------------
//  PostContent.swift
//  Swift Many Socials
//  Created by blaze Wheeler
//-------------------------------------
// Contains Post Content For Instagram()
//-------------------------------------


import SwiftUI

struct PostContent: View {
    var image: String = "tomPost"
    
    var body: some View {
        VStack(spacing: 0) {
            Image(image)
                .resizable()
                .frame(width: .infinity)
                .aspectRatio(contentMode: .fit)
            
            HStack{
                HStack(spacing: 10){
                    Image("heart")
                    Image("comment")
                    Image("share")
                }
                Spacer()
                
                Image("bookmark")
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 9)
            
        }
    }
}
struct PostHeader: View {
    var body: some View {
        HStack {
            HStack{
                Image("Tom")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .cornerRadius(50)
                Text("Tom")
                    .font(.caption)
                    .fontWeight(.bold)
                
            }
            Spacer()
            
            Image("more")
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 8)
    }
}

struct Post: View {
    var image: String = "tomPost"
    var description: String = "Add me on Myspace"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            PostHeader()
            PostContent(image: image)
            
            Text("Liked by Elon Musk and others")
                .font(.footnote)
                .frame(width: .infinity)
                .padding(.horizontal, 12)
            
            Text(description)
                .font(.footnote)
                .frame(width: .infinity)
                .padding(.horizontal,12)
            HStack {
                HStack(spacing: 7){
                    Image("profile")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .cornerRadius(50)
                    Text("Add Comment...")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                Spacer()
                
                HStack{
                    Text("😍")
                    Text("😂")
                    Image(systemName: "plus.circle")
                        .foregroundColor(.secondary)
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 9)
            
            
        }
    }
}
