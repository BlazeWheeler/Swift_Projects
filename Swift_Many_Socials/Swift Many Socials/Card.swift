//-------------------------------------
//  Card.swift
//  Swift Many Socials
//  Created by blaze Wheeler
//-------------------------------------
// Contents For Tinder UI
//-------------------------------------

import UIKit


//MARK: - DATA
struct Card: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let age: Int
    let bio: String
    /// Card x position
    var x: CGFloat = 0.0
    /// Card y position
    var y: CGFloat = 0.0
    /// Card rotation angle
    var degree: Double = 0.0
    
    static var data: [Card] {
        [
            Card(name: "Mark", imageName: "zuckTinder", age: 47, bio: "Figuring out the next big trend 🌎"),
            Card(name: "Susan", imageName: "susanTinder", age: 53, bio: "Work smart. Get things done 🤓"),
            Card(name: "Elon", imageName: "elonTinder", age: 50, bio: "I would like to die on Mars. Just not on impact 👽"),
            Card(name: "George", imageName: "georgeTinder", age: 32, bio: "AI?! better put a comma after 🚙"),
            Card(name: "Jeff", imageName: "jeffBezos", age: 57, bio: "What's going to change in the next 10 years? 🤔"),
            Card(name: "Bill", imageName: "billGates", age: 66, bio: "Success is a lousy teacher 👩‍🏫"),
        ]
    }
    
}
