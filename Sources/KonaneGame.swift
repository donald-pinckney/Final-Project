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
x   - private blackInputSource: KonaneMoveInputSource
x   - private whiteInputSource: KonaneMoveInputSource
    - play() -> Bool // Returns true if black wins.
    - private displayBoard()
*/





//WILL FIX LATER FIRST GETTING INITIALIZATION DONE
class KonaneGame {

    private var gameState = GameState(width: 16, height: 16, isBlackTurn: true)
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

func displayBoard() {
    var arbitraryVariable = 0

    for rowNumber in (0..<gameState.height).reversed() {
        //Print row numbering
        if rowNumber < 10 {
            print(" \(rowNumber)", terminator:" ")
        }
        else {
            print("\(rowNumber)", terminator:" ")
        }
        //Print actual board
        for columnNumber in 0..<gameState.width {
            if gameState.gameBoard[columnNumber][rowNumber] == KonaneColor.black {
                print(" x", terminator: " ") //black square
            }
            else if gameState.gameBoard[columnNumber][rowNumber] == KonaneColor.white {
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
    while arbitraryVariable < gameState.height {
        if arbitraryVariable < 10 {
            print(" \(arbitraryVariable)", terminator: " ")
        } else {
            print("\(arbitraryVariable)", terminator: " ")

        }
        arbitraryVariable += 1
    }

    print()
}

func play() -> Bool {
    while(true) { //ADD CONTENTS AND ACTUALLY WRITE CODE
      break
    }
    return false
}
