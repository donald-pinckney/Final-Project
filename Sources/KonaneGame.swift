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

    private let blackIsHuman: Bool = true
    private let whiteIsHuman: Bool = true
    private var gameState: KonaneGameState = KonaneGameState.gameBoard

    //BEGIN User input to initialize KonaneGame
    private var initializeBlack: Bool = true
    private var initializeWhite: Bool = true
}


    
func initializeGame () {
    print("Is black human? [Y/N]:", terminator: " ")
    
    if String(readLine()!) ==  "Y" {
        print("Black is human")
        initializeBlack = true
    }
    else if String(readLine()!) ==  "N" {
        print("Black is AI")
        initializeBlack = false
    }
    else {
        print("Invalid. Please start over.")
        //IDK WHAT THIS DO
        //repeat initializeGame
    }
    print("Is white human? [Y/N]")
    
    if String(readLine()!) ==  "Y"{
        print("White is human")
        initializeWhite = true
    }
    else if String(readLine()!) ==  "N" {
        print("White is AI")
        initializeWhite = false
    }
    else {
        print("Invalid. Please start over.")
        //IDK WHAT THIS DO
        //repeat initializeGame
    }
    
    //END User input to initialize KonaneGame
    
    //Initialize KonaneGame with user input
    //WILL FIX ONCE FUNC IS DONE
    //init (blackIsHuman = initializeBlack, whiteIsHuman = initializeWhite)
    
    print()

}


    //write code for human playing
    /* first step remomval of pieces
    */


}