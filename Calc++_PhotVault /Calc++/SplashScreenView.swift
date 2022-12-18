//
//  Calc++
//  SplashScreenView.swift
//  CalcApp
//  Created by Blaze Wheeler  on 11/1/22.
//  See the License.txt file for this sample’s licensing information.
//



import SwiftUI

struct SplashScreenView: View {
    
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        
        
        if isActive {
            CalcView()
        } else {
            VStack{
                
                
                VStack{
                    
                    Image("splashPhoto")
                        .resizable()
                        .frame(width: 200.0, height: 200.0)
                    Text("Calc++").font(.system(.largeTitle)).bold()
                    
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
