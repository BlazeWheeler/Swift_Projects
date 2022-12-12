//
//  BotResponse.swift
//  SwiftChatBot
//
//  Created by blaze Wheeler on 2/12/22.
//
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
    } else if tempMessage.contains("goodbye") {
        return "Talk to you later!"
    } else if tempMessage.contains("how are you") {
        return "I'm fine, how about you?"
    }
        else if tempMessage.contains("charles darwin"){
        return "Charles Robert Darwin was an English naturalist, geologist and biologist, best known for his contributions to evolutionary biology. "
        
    } else if tempMessage.contains("james hutton"){
        return "James Hutton FRSE was a Scottish geologist, agriculturalist, chemical manufacturer, naturalist and physician. Often referred to as the ‘father’ of modern geology, he played a key role in establishing geology as a modern science."
    }else if tempMessage.contains("scala naturae"){
        return "The great chain of being is a hierarchical structure of all matter and life, thought by medieval Christianity to have been decreed by God. The chain begins with God and descends through angels, humans, animals and plants to minerals."
    }
    else if tempMessage.contains("george cuvier"){
        return "Jean Léopold Nicolas Frédéric, Baron Cuvier, known as Georges Cuvier, was a French naturalist and zoologist, sometimes referred to as the founder of paleontology."
    }
    
    else {
        return "I'm having trouble understanding?"
    }
}
