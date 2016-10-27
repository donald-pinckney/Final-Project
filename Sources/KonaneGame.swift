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
    - play() -> Bool // Returns true if black wins.
    - private displayBoard()
*/

//WILL FIX LATER FIRST GETTING INITIALIZATION DONE
class KonaneGame {

    let blackIsHuman: Bool
    let whiteIsHuman: Bool
    var gameState = 0 //WRITE CODE FOR THIS ACCESSING THE GAME STATE
    
    init(blackIsHuman: Bool, whiteIsHuman: Bool) {
        self.blackIsHuman = blackIsHuman
        self.whiteIsHuman = whiteIsHuman

    }
    
    
}

func initializeGame() -> (blackIsHuman: Bool, whiteIsHuman: Bool) {
    var isBlackHuman: Bool = true
    var isWhiteHuman: Bool = true
    var response = ""
    print("Is black human? [Y/N]:")
    
    response = String(readLine()!)!
    if response ==  "Y" {
        print("Black is human")
        isBlackHuman = true
    } else if response ==  "N" {
        print("Black is AI")
        isBlackHuman = false
    } else {
        print("Invalid. Please start over.")
    }
    
    
    print("Is white human? [Y/N]")
    
    response = String(readLine()!)!
    if response ==  "Y" {
        print("White is human")
        isWhiteHuman = true
    } else if response ==  "N" {
        print("White is AI")
        isWhiteHuman = false
    } else {
        print("Invalid. Please start over.")
        
    }
    
    print()
    
    return (isBlackHuman, isWhiteHuman)
    //END User input to initialize KonaneGame
    
    //Initialize KonaneGame with user input
    //WILL FIX ONCE FUNC IS DONE
    //init (blackIsHuman = initializeBlack, whiteIsHuman = initializeWhite)
    

}

