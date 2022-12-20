//
//  Home.swift
//  QuizGame
//
//  Created by blaze Wheeler on 2/18/22.
//

import SwiftUI

struct Home: View {
    // MARK: Current Puzzle
    @State var currentPuzzle: Puzzle = puzzles[0]
    @State var selectedLetters: [Letter] = []
    @State var strCheck = ""
   
   
    var body: some View {
        let amtOfPuzzles = (puzzles.count - 1)
        VStack{
            VStack{
                HStack{
                //MARK: Back Button
                    Button{
                        if(currentPuzzle.place == 0){
                            // starting puzzle
                            currentPuzzle = puzzles[0]
                            generateLetters()
                          
                        }else{
                            // MARK: Change To Next Puzzle
                            selectedLetters.removeAll()
                            
                            currentPuzzle = puzzles[currentPuzzle.place - 1 ]
                            // Generate Letters For New Puzzle
                            
                            generateLetters()
                        }
                        
                    } label: {
                        Image(systemName: "arrowtriangle.backward.fill")
                            .font(.title3)
                            .padding(10)
                            .background(Color("Pink"), in: Circle())
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Button {
                      
                        if(currentPuzzle.place == amtOfPuzzles){
                            currentPuzzle = puzzles[0]
                            generateLetters()
                            
                        }else{
                            // MARK: Change To Next Puzzle
                            
                            selectedLetters.removeAll()
                            currentPuzzle = puzzles[currentPuzzle.place + 1 ]
                            // Generate Letters For New Puzzle
                          
                            generateLetters()
                        }
                        
                    } label: {
                        Image(systemName: "arrowtriangle.right.fill")
                            .font(.title3)
                            .padding(10)
                            .background(Color("Pink"), in: Circle())
                            .foregroundColor(.white)
                    }
                }
                // MARK: Level System
                .overlay {
                    if(currentPuzzle.place <= 9){
                        Text("Level 1")
                            .fontWeight(.bold)
                    }
                    else if(currentPuzzle.place >= 10 && currentPuzzle.place < 20 ){
                        Text("Level 2")
                            .fontWeight(.bold)
                    }
                    if(currentPuzzle.place >= 20 && currentPuzzle.place < 30 ){
                        Text("Level 3")
                            .fontWeight(.bold)
                    }
    
                }
                //MARK: Puzzle Image
                Image(currentPuzzle.imageName)
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: currentPuzzle.imageName == "Homology" ? 100 : 0 ))
                    .padding(.top)
                
                //MARK: Puzzle Fill Blanks
                HStack(spacing: 10){
                    
                    //MARK: Index helps read the selected letters in order
                    ForEach(0..<currentPuzzle.answer.count, id: \.self){index in
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(.systemPink).opacity(selectedLetters.count > index ? 1 : 0.2))
                                .frame(height: 60)
                            // Dislay Letter
                            if selectedLetters.count > index{
                                Text(selectedLetters[index].value)
                                    .font(.title)
                                    .fontWeight(.black)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
            }
            .padding()
            .background(.white, in: RoundedRectangle(cornerRadius: 15))
            
            // Honey Comb Grid View
            HoneyCombGridView(items: currentPuzzle.letters){ item in
                // MARK: Hexagon Shape
                ZStack {
                    HexagonShape()
                        .fill(isSelected(letter: item) ? Color("Pink"): .white)
                        .aspectRatio(contentMode: .fit)
                        .shadow(color: .black.opacity(0.1), radius: 5, x: 10, y: 5)
                        .shadow(color: .black.opacity(0.1), radius: 5, x: -5, y: 8)
                    Text(item.value)
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .foregroundColor(isSelected(letter: item) ? .white : .gray.opacity(0.5))
                }
                .contentShape(HexagonShape())
                .onTapGesture {
                    // Adding The Current Letters
                    addLetter(letter: item)
                }
            }
            // MARK: Next Button
            Button {
                
                // MARK: Call selected letters checking function
                checkCorrect(strCheck: strCheck)
                // MARK: Change To Next Puzzle
                if(strCheck.lowercased() == currentPuzzle.answer.lowercased()){
                    // MARK: if current puzzle place == num Of Puzzles Start Over
                    if(currentPuzzle.place == amtOfPuzzles){
                        currentPuzzle = puzzles[0]
                        selectedLetters.removeAll()
                        generateLetters()
                      
                    // Else move forward through levels
                    }else{
                        currentPuzzle = puzzles[currentPuzzle.place + 1 ]
                        selectedLetters.removeAll()
                       
                        // Generate Letters For New Puzzle
                      generateLetters()
                        
                    }
                }
            } label: {
                Text("Next")
               
                    .font(.title3.bold())
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemPink), in: RoundedRectangle(cornerRadius: 15))
            }
            Divider()
               
        }
        .padding()
        .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("ColorBG1"))
        
        .onAppear{
            
            // Stop Regeneration Of Letters On Ever Home() Call
            if(currentPuzzle.letters.count > 0 ){
                selectedLetters.removeAll()
            } else {
                //Generating Letters
                generateLetters()
            }
        }
        
    }
    
    func addLetter(letter: Letter){
        withAnimation {
            if isSelected(letter: letter) {
                // MARK: Removing
                selectedLetters.removeAll { currentLetter in
                    return currentLetter.id == letter.id
                }
                
            } else {
                if selectedLetters.count == currentPuzzle.answer.count{return}
                selectedLetters.append(letter)
            }
           
        }
    }
    
    // MARK: Checking If There Is Already One
    func isSelected(letter: Letter)-> Bool {
        return selectedLetters.contains { currentLetter in
            return currentLetter.id == letter.id
        }
    }
    
    func generateLetters(){
        currentPuzzle.jumbbledWord.forEach { character in
            currentPuzzle.letters.append(Letter(value: String(character)))
        }
    }
    func checkCorrect( strCheck : String){
        // Adds selected letters to temp varaible
        if(strCheck.lowercased() == currentPuzzle.answer.lowercased()){
          return
        } else {
            // clears Chekcing String if not correct
            self.strCheck = ""
            for letter in selectedLetters {
                self.strCheck += String(letter.value)
            }
            
        selectedLetters.removeAll()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
       
    }
}
