//
//  KonaneGame.swift
//  
//
//  Created by Alex Hill on 10/20/16.
//
//

import Foundation

/*
KonaneGame
x   - init(blackIsHuman: Bool, whiteIsHuman: Bool)
x   - private gameState: KonaneGameState
    - private blackInputSource: KonaneMoveInputSource
    - private whiteInputSource: KonaneMoveInputSource
    - play() -> Bool // Returns true if black wins or if white wins
    - private displayBoard()
*/





//WILL FIX LATER FIRST GETTING INITIALIZATION DONE
class KonaneGame {

    private var gameState = KonaneGameState.GameState(width: 16, height:16, isBlackTurn: true)
    private let blackInputSource: KonaneMoveInputSource 
    private let whiteInputSource: KonaneMoveInputSource


    init(blackIsHuman: Bool, whiteIsHuman: Bool) {

        if blackIsHuman {
        	blackInputSource = KonaneMoveInputSourceHuman(isBlack: true)
        }
        else {
        	//FIX ONCE AI CODE EXISTS
        	blackInputSource = KonaneMoveInputSourceHuman(isBlack: true)
        }
        if whiteIsHuman {
        	whiteInputSource = KonaneMoveInputSourceHuman(isBlack: false)
        }
        else {
        	//FIX ONCE AI CODE EXISTS
        	whiteInputSource = KonaneMoveInputSourceHuman(isBlack: false)
        }
    }    
}



func play() {
    
    //function to print the game board
    //function to remove pieces
    //function to jump a piecce
        //if no piece is available to jump, return bool: whiteHasWon: true or blackHasWon: true
}




//Displays the game board in terminal
//FIX WITH PROPER VARIABLE NAMES
func displayBoard() {
    
    var arbitraryVariable = 0
    
    for rowNumber in (0..<myKonaneGameState.height).reversed() {
        //Print row numbering
        if rowNumber < 10 {
            print(" \(rowNumber)", terminator:" ")
        }
        else {
            print("\(rowNumber)", terminator:" ")
        }
        //Print actual board
        for columnNumber in 0..<myKonaneGameState.width {
            if myKonaneGameState.gameBoard[columnNumber][rowNumber] == KonaneColor.black {
                print(" x", terminator: " ") //black square
            }
            else if myKonaneGameState.gameBoard[columnNumber][rowNumber] == KonaneColor.white {
                print(" o", terminator: " ") //white square
            }
            else {
                print("  ", terminator: " ") //empty square
            }
        }
        print() //uses a terminator to make new line
        //Print column numbering
        
    }
    
    print("   ", terminator:"")
    while arbitraryVariable < myKonaneGameState.height {
        if arbitraryVariable < 10 {
            print(" \(arbitraryVariable)", terminator: " ")
        } else {
            print("\(arbitraryVariable)", terminator: " ")
            
        }
        arbitraryVariable += 1
    }
    
    print()
}
//END printGameBoard()