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

    private var gameState = KonaneGameState(width: 16, height: 16, isBlackTurn: true)
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

    /*Criteria for function:
    -start the game with remove piece funtions
    -create loop for gameplay with moves
        -finish when didWin funcitons return true
    -return a bool for true
    -display a win and lose message
*/
    //Start of Gameplay
    //Starts game by displaying the game board
    //player1 is black
    //player2 is white
    var winBool = false
    gameState.populateGameBoard()
    displayBoard()

    print("What are the coordinates of the piece player1 wants to remove?")
    let blackRemoveCoordx = Int(readLine()!)!
    let blackRemoveCoordy = Int(readLine()!)!

    //make first removal's to start the game
    gameState.perform(blackRemove: (x: blackRemoveCoordx, y: blackRemoveCoordy))
    displayBoard()
    print("What are the coordinates of the piece player2 wants to remove?")
    let whiteRemoveCoordx = Int(readLine()!)!
    let whiteRemoveCoordy = Int(readLine()!)!

    gameState.perform(whiteRemove: (x: whiteRemoveCoordx, y: whiteRemoveCoordy))

    while winBool == false {
        displayBoard()
        if gameState.isBlackTurn {
            print("What are the coordinates of the piece player1 wants to move?")
            var xCoordFromX =  Int(readLine()!)!
            var yCoordFromY =  Int(readLine()!)!
            print("How far do you want to move from these coordinates?")
            var xCoordToX =  Int(readLine()!)!
            var yCoordToY =  Int(readLine()!)!

            var move: KonaneMove = KonaneMove(fromX: xCoordFromX, fromY: yCoordFromY, toX: xCoordToX, toY: yCoordToY)
            gameState.perform(move: move)
            winBool = gameState.didBlackWin()

        } else {
            print("What are the coordinates of the piece player2 wants to move?")
            var xCoordFromX =  Int(readLine()!)!
            var yCoordFromY =  Int(readLine()!)!
            print("How far do you want to move from these coordinates?")
            var xCoordToX =  Int(readLine()!)!
            var yCoordToY =  Int(readLine()!)!

            var move: KonaneMove = KonaneMove(fromX: xCoordFromX, fromY: yCoordFromY, toX: xCoordToX, toY: yCoordToY)
            gameState.perform(move: move)
            winBool = gameState.didWhiteWin()
        }

        if winBool && gameState.isBlackTurn {
            print("Player1 has won the game!")
        } else if winBool && !gameState.isBlackTurn{
            print("Player1 has won the game!")
        }
        return winBool


        //call funciton to move a piece

    }
    }    //End of Gameplay
}
//End of Class
