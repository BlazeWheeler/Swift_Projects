//
//  BotResponse.swift
//  SwiftChatBot
//
//  Created by blaze Wheeler on 2/12/22.
//
import OpenAISwift
import SwiftUI
import Foundation

struct VocabWord: Identifiable{
    var id: String = UUID().uuidString
    var name: String
    var definition: String
    var place : Int
    
}


var word : [VocabWord] = [
    VocabWord(name: "abiotic", definition: "A physical, or nonliving, factor that shapes an ecosystem.",  place: 0),
    VocabWord(name: "abiotic factor", definition: "physical, or nonliving, part of an ecosystem",  place: 1),
    VocabWord(name: "acoelomate", definition: "having no body cavity",  place: 2)
    
]

/*
 IDEA
func checkState(message: String) -> Int {
    @State var currentVocab: VocabWord = word[0]
    
    let tempMessage = message.lowercased()
    
    if tempMessage.contains(currentVocab.name){
        return currentVocab.place
    }
    
    return currentVocab.place
    
    
}
*/

func getBotResponse(message: String) -> String {
    
    
    //@State var currentVocab: VocabWord = word[checkState(message: message)]
    
    let tempMessage = message.lowercased()

   // if tempMessage.contains(currentVocab.name){
        //return currentVocab.definition
    //}
    
    
    if tempMessage.contains("hello"){
        return "Hey there!"
    }
    if tempMessage.contains("goodbye") {
        return "Talk to you later!"
    }
    if tempMessage.contains("how are you") {
        return "I'm fine, how about you?"
    }
    else {
        return ""
        
    }
   
}
