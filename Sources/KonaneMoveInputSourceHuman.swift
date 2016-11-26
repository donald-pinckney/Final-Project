//
//  KonaneMoveInputSourceHuman.swift
//
//
//  Created by Alex Hill on 10/20/16.
//
//

import Foundation

class KonaneMoveInputSourceHuman: KonaneMoveInputSource {
    
    func askForInput(gameState: KonaneGameState) -> (xCoord: Int, yCoord: Int) {
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
    

	override func removeFirstPiece(gameState: KonaneGameState) -> (xCoord: Int, yCoord: Int) {
        var removeBlackTuple: (xCoord: Int, yCoord: Int)
        while true {
            print("What are the coordinates of the piece player1 (x's) wants to remove?")
            removeBlackTuple = askForInput(gameState: gameState)
            
            if gameState.isValid(blackRemove: (x: removeBlackTuple.xCoord, y: removeBlackTuple.yCoord)) {
                return removeBlackTuple
            } else {
                print("Not a valid move")
            }
        }
	}
    
    
    override func removeSecondPiece(gameState: KonaneGameState) -> (xCoord: Int, yCoord: Int) {
        var removeWhiteTuple: (xCoord: Int, yCoord: Int)
        while true {
            print("What are the coordinates of the piece player2 (o's) wants to remove?")
            removeWhiteTuple = askForInput(gameState: gameState)
            
            if gameState.isValid(whiteRemove: (x: removeWhiteTuple.xCoord, y: removeWhiteTuple.yCoord)) {
                return removeWhiteTuple
            } else {
                print("Not a valid move")
            }
        }
    }
    
    
    override func nextMove(gameState: KonaneGameState) -> KonaneMove {
        
        var move: KonaneMove = KonaneMove(fromX: 0, fromY: 0, toX: 0, toY: 0)

        if gameState.isBlackTurn {
            
            while true {
                print("What are the coordinates of the piece player1 (x's) wants to move?")
                let fromCoordTuple = askForInput(gameState: gameState)
                print("Where do you want to move that tile too?")
                let toCoordTuple = askForInput(gameState: gameState)
                
                move = KonaneMove(fromX: fromCoordTuple.xCoord, fromY: fromCoordTuple.yCoord, toX: toCoordTuple.xCoord, toY: toCoordTuple.yCoord)
                
                if gameState.isValid(move: move) {
                    return move
                } else {
                    print("That was not a valid move, try again")
                }
            }
        } else if !gameState.isBlackTurn {
            while true {
                print("What are the coordinates of the piece player2 (o's) wants to move?")
                let fromCoordTuple = askForInput(gameState: gameState)
                print("Where do you want to move that tile too?")
                let toCoordTuple = askForInput(gameState: gameState)
                
                move = KonaneMove(fromX: fromCoordTuple.xCoord, fromY: fromCoordTuple.yCoord, toX: toCoordTuple.xCoord, toY: toCoordTuple.yCoord)
                if gameState.isValid(move: move) {
                    return move
                } else {
                    print("Error in play function")
                }
            }
        }
        print("ERROR ERROR ERROR: nextMove defualted to (fromX: 0, fromY: 0, toX: 0, toY: 0)")
        return move
    }
    
    
    
    
}
