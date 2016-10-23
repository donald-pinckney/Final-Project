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

class KonaneGame {

    private let blackIsHuman: Bool = true
    private let whiteIsHuman: Bool = true
    private var gameState: KonaneGameState = KonaneGameState.gameBoard

    //BEGIN User input to initialize KonaneGame
    private var initializeBlack: Bool = true
    private var initializeWhite: Bool = true

    initialize while true {
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
            repeat initialize
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
            repeat initialize
        }
        break initialize
    }
    //END User input to initialize KonaneGame

    //Initialize KonaneGame with user input
    init (blackIsHuman = initializeBlack, whiteIsHuman = initializeWhite)

    print()


    //write code for human playing
    /* first step remomval of pieces
    */


}