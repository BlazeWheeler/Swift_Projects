//
//  GameViewModel.swift
//  Tic-Tac-Toe
//
//  Created by blaze Wheeler on 8/21/21.
//

import SwiftUI

final class GameViewModel: ObservableObject {
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible()),]
    
    @Published var moves:[Move?] = Array(repeating: nil, count: 9)
    @Published var isGameBoardDisabled = false
    @Published var alertItem: AlertItem?
    
    
    func ProcessPlayerMove(for position: Int){
        if isSquareOccupied(in: moves, forIndex: position){return}
        
        moves[position] = Move(player: .human , boardIndex: position)
        
        // check for win condition or draw
        
        if checkWinCondition(for: .human, in: moves){
            alertItem = AlertContex.humanWin
            return
        }
        
        if checkForDraw(in: moves) {
            alertItem = AlertContex.draw
            return
        }
        
        isGameBoardDisabled = true
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
            
            let computerPostion = determineComputerMovePosition(in: moves)
            
            moves[computerPostion] = Move(player: .computer , boardIndex: computerPostion)
            isGameBoardDisabled = false
            
            if checkWinCondition(for: .computer, in: moves){
                alertItem = AlertContex.computerWin
                return
            }
            if checkForDraw(in: moves) {
                alertItem = AlertContex.draw
                return
            }
        }
    }
    
    
    
    
    
    func isSquareOccupied(in moves : [Move?], forIndex index: Int) -> Bool {
        return moves.contains(where: {$0?.boardIndex == index})
        
    }
    func determineComputerMovePosition(in moves: [Move?]) -> Int {
        /*
            --- AI Logic ---
            // If AI Can Win, Then Win
            // If AI Can Not Win, Then Block
            // If AI Can Not Block, Then Take Middle Postion
            // If AI Can Not Take Middle Postion, Take Random Available Postion
         */
        
        
        // If AI Can Win, Then Win
        let winPatterns: Set<Set<Int>> = [[0,1,2], [3,4,5],[6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8],[2,4,6]]
        
        let computerMoves = moves.compactMap{ $0 }.filter { $0.player == .computer}
        let computerPostions = Set(computerMoves.map {$0.boardIndex})
        
        for pattern in winPatterns {
            let winPositions = pattern.subtracting(computerPostions)
            
            if winPositions.count == 1 {
                let isAvaiable = !isSquareOccupied(in: moves, forIndex: winPositions.first!)
                if isAvaiable {return winPositions.first!}
            }
        }
        
        // If AI Can Not Win, Then Block
        let humanMoves = moves.compactMap{ $0 }.filter { $0.player == .human}
        let humanPostions = Set(humanMoves.map {$0.boardIndex})
        
        for pattern in winPatterns {
            let winPositions = pattern.subtracting(humanPostions)
            
            if winPositions.count == 1 {
                let isAvaiable = !isSquareOccupied(in: moves, forIndex: winPositions.first!)
                if isAvaiable {return winPositions.first!}
        
            }
        }
        
        
        // If AI Can Not Block, Then Take Middle Postion
        let centerSquare = 4
        if !isSquareOccupied(in: moves, forIndex: centerSquare) {
            return centerSquare
        }
        
        
        // If AI Can Not Take Middle Postion, Take Random Available Postion
        var movePosition = Int.random(in: 0..<9)
        
        while isSquareOccupied(in: moves, forIndex: movePosition){
             movePosition = Int.random(in: 0..<9)
        }
        return movePosition
    }
    
    func checkWinCondition(for player: Player, in moves:[Move?]) -> Bool {
        
        let winPatterns: Set<Set<Int>> = [[0,1,2], [3,4,5],[6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8],[2,4,6]]
        
        let playerMoves = moves.compactMap{ $0 }.filter { $0.player == player }
        let playerPostions = Set(playerMoves.map {$0.boardIndex})
        
        for pattern in winPatterns where pattern.isSubset(of: playerPostions){ return true}
        
        return false
        
        
   
        
    }
    
    func checkForDraw(in moves: [Move?]) -> Bool {
        return moves.compactMap {$0}.count == 9
        
    }
    
    func resetGame() {
        moves = Array(repeating: nil, count: 9)
    }
}
