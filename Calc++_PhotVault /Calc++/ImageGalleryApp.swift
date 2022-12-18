//
//  Calc++
// ImageGalleryApp.swift
//  Created by Blaze Wheeler  on 11/1/22.
//  See the License.txt file for this sample’s licensing information.
//


import SwiftUI

@main
struct ImageGalleryApp: App {
    @StateObject var dataModel = DataModel()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                SplashScreenView()
            }
            .environmentObject(dataModel)
            .navigationViewStyle(.stack)
        }
    }
}

