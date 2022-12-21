//-------------------------------------
// Instagram.swift
//  Swift Many Socials
//  Created by blaze Wheeler
//-------------------------------------
// Instagram UI View
//-------------------------------------

import SwiftUI

struct Instagram: View {
    var body: some View {
        VStack(spacing: 0.0) {
            Header()
            ScrollView(.vertical, showsIndicators: false) {
                Stories()
                
                Divider()
                
                Post()
                
                Post(image: "dog", description: "This is My dog... ❤️")
                
            }
        }
    }
}

struct Instagram_Previews: PreviewProvider {
    static var previews: some View {
        Instagram()
    }
}

struct Header: View {
    var body: some View {
        HStack{
            Image("logo")
            Spacer()
            HStack(spacing: 20.0){
                Image("add")
                Image("heart")
                Image("messenger")
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 3)
    }
}
