//-------------------------------------
// FaceBookUI.swift
//  Swift Many Socials
//  Created by blaze Wheeler
//-------------------------------------
// Facebook UI View
//-------------------------------------

import SwiftUI

let primary = Color(#colorLiteral(red: 0.1410247684, green: 0.144975543, blue: 0.1532749236, alpha: 1))
let secondary = Color(#colorLiteral(red: 0.2313431799, green: 0.2313894629, blue: 0.2313401997, alpha: 1))
let ternary = Color(#colorLiteral(red: 0.09396985918, green: 0.09791258723, blue: 0.1062180027, alpha: 1))
let lightGray = Color(#colorLiteral(red: 0.681789577, green: 0.6977746487, blue: 0.7185279727, alpha: 1))

struct FaceBookUI: View {
    
    var body: some View {
        ZStack {
            primary
                .edgesIgnoringSafeArea(.all)
            VStack {
                ScrollView(showsIndicators: false) {
                    Facebook_Header()
                    Create_FBPost()
                    H_Divider()
                    FB_StoryFeed()
                    H_Divider()
                    FB_Post_UIFeed()
                }
            }
            .foregroundColor(.white)
        }
    }
}

struct FaceBookUI_Previews: PreviewProvider {
    static var previews: some View {
        FaceBookUI()
    }
}



