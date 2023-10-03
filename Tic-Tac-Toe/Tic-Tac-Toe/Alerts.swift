//
//  Alerts.swift
//  Tic-Tac-Toe
//
//  Created by blaze Wheeler on 8/13/21.
//

import SwiftUI

struct AlertItem: Identifiable {
    
    let id = UUID()
    
    var Title: Text
    var Message: Text
    var buttonTitle: Text
    
    
}

struct AlertContex {
    
    static let humanWin = AlertItem(Title: Text("You Win!"),
                                    Message: Text("Congrats! You Are Smarter Than This AI."),
                                    buttonTitle: Text("Nice Job"))
    
    static let computerWin = AlertItem(Title: Text("You Lost!"),
                                       Message: Text("Sorry! Everyone Gets Lucky Once."),
                                       buttonTitle: Text("Rematch"))
    
    static let draw = AlertItem(Title: Text("It's A Draw!"),
                                Message: Text("Looks Like You Have Met You're Match."),
                                buttonTitle: Text("Nice Job"))
}
