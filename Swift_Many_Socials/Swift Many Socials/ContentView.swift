//-------------------------------------
// ContentView.swift
//  Swift Many Socials
//  Created by blaze Wheeler
//-------------------------------------
// Home Default On FaceBookUIView()
//-------------------------------------
import SwiftUI

struct ContentView: View {
    
    var body: some View {
     
        tab_Bar()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct tab_Bar: View {
    var body: some View {
        TabView {
            FaceBookUI()
                .tabItem {
                    Image("facebook-square-fill")
                        .resizable()
                    Text("FaceBook")
                }
           SnapChat()
                .tabItem {
                    Image("snapchat-fill")
                        .resizable()
                        .foregroundColor(.gray)
                
                       
                    Text("SnapChat")
                }
            Instagram()
                .tabItem {
                    Image("instagram-fill")
                    Text("Instagram")
                }
            Tinder()
                .tabItem {
                    Image( "tinder-fill")
                    Text("Tinder")
            }
        }
        .onAppear() {
            UITabBar.appearance().barTintColor = .white
            
        }
    }
}
