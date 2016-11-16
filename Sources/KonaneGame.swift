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

    private var gameState = KonaneGameState(width: 2, height: 2, isBlackTurn: true)
    private let blackInputSource: KonaneMoveInputSource
    private let whiteInputSource: KonaneMoveInputSource


    init(blackIsHuman: Bool, whiteIsHuman: Bool) {

        if blackIsHuman {
            blackInputSource = KonaneMoveInputSourceHuman(isBlack: true)
        }
        else {
        	//FIX ONCE AI CODE EXISTS
            blackInputSource = KonaneMoveInputSourceAI(isBlack: true)
        }
        if whiteIsHuman {
            whiteInputSource = KonaneMoveInputSourceHuman(isBlack: false)
        }
        else {
        	//FIX ONCE AI CODE EXISTS
            whiteInputSource = KonaneMoveInputSourceAI(isBlack: false)
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

    
    
    func askForInput() -> (xCoord: Int, yCoord: Int) {
        while true {
            let x = Int(readLine()!)
            let y = Int(readLine()!)
            if x != nil && y != nil && x! < gameState.height && y! < gameState.height && x! >= 0 && y! >= 0 {
                return (xCoord: x!, yCoord: y!)
            } else  {
                print("This is not a valid input. Try again")
            }
        }
    }
    
    
    func play() -> Bool {

        var winBool = false
        var move: KonaneMove = KonaneMove(fromX: 0, fromY: 0, toX: 0, toY: 0)
        
        //real play function
        gameState.populateGameBoard()
        
        displayBoard()
        
        gameState.perform(blackRemove: blackInputSource.removeFirstPiece(gameState: gameState))
        
        displayBoard()
        
        gameState.perform(whiteRemove: whiteInputSource.removeSecondPiece(gameState: gameState))
        
        displayBoard()
        
        while winBool == false {
            if gameState.getIsBlackTurn() {
                move = blackInputSource.nextMove(gameState: gameState)
            } else if !gameState.getIsBlackTurn() {
                move = whiteInputSource.nextMove(gameState: gameState)
            } else {
                print("Error not black or white's turn?")
            }
            
            gameState.perform(move: move)
            
            if !gameState.getIsBlackTurn() && gameState.didBlackWin() {
                winBool = true
            } else if gameState.getIsBlackTurn() && gameState.didWhiteWin() {
                winBool = true
            } else {
                winBool = false
            }
            
            //Changes turn
            gameState.isBlackTurn = !gameState.isBlackTurn
            
            displayBoard()
        }
        //Need to account for the fact that the player has changed
        //That's why the code and players seem switched
        if !gameState.getIsBlackTurn() {
            print("Player1 (x's) has won the game!")
        } else if gameState.getIsBlackTurn() {
            print("Player2 (o's) has won the game!")
        }
        return winBool
    }
}
//End of Class
