//
//  KonaneMoveInputSourceAIcomputer.swift
//
//
//  Created by Alex Hill on 10/20/16.
//
//


// Use minimax somehow lmao
import Foundation

class KonaneMoveInputSourceAI: KonaneMoveInputSource {
    
    override func removeFirstPiece(gameState: KonaneGameState) -> (xCoord: Int, yCoord: Int) {
        return (xCoord: 0, yCoord: 0)
    }
    
    override func removeSecondPiece(gameState: KonaneGameState) -> (xCoord: Int, yCoord: Int) {
        return (xCoord: 1, yCoord: 0)
    }   

    override func nextMove(gameState: KonaneGameState) -> KonaneMove {
    	let currentGame = gameState
    	var advancedGame = currentGame
    	var possibleMoves: [KonaneMove]
    	var responses: Int 
    	var bestResponse: Int = 1000000000 //Needs to be big
    	var bestMove: KonaneMove

    	if currentGame.getIsBlackTurn() {

	    	for fromX in currentGame.gameBoard {
	    		for fromY in currentGame.gameBoard[fromX] {
		    		if currentGame.gameBoard[fromX][fromY] == KonaneColor.black {
		    			for toX in currentGame.gameBoard {
		    				for toY in currentGame.gameBoard[toX] {
		    					if currentGame.isValid(move: (fromX: fromX, fromY: fromY, toX: toX, toY: toY)) {
		    						possibleMoves.append((fromX: fromX, fromY: fromY, toX: toX, toY: toY)) 
		    					}
		    				}
		    			}
		    		}
		    	}
	    	}

	    	for possibleMove in possibleMoves {
	    		responses = 0
	    		advancedGame.gameBoard = currentGame.gameBoard
	    		advancedGame.perform(move: possibleMove)
	    		for fromX in advancedGame.gameBoard {
	    			for fromY in advancedGame.gameBoard[fromX] {
	    				if advancedGame.gameBoard[fromX][fromY] == KonaneColor.white {
	    					for toX in advancedGame.gameBoard {
	    						for toY in advancedGame.gameBoard[toX] {
	    							if currentGame.isValid(move: (fromX: fromX, fromY: fromY, toX: toX, toY: toY)) {
		    							responses += 1
		    						}
	    						}
	    					}
	    				}
	    			}
	    		}
	    		if responses < bestResponse {
	    			bestResponse = responses
	    			bestMove = possibleMove
	    		}
	    	}
	    }
	    else if !currentGame.getIsBlackTurn() {

	    	for fromX in currentGame.gameBoard {
	    		for fromY in currentGame.gameBoard[fromX] {
		    		if currentGame.gameBoard[fromX][fromY] == KonaneColor.white {
		    			for toX in currentGame.gameBoard {
		    				for toY in currentGame.gameBoard[toX] {
		    					if currentGame.isValid(move: (fromX: fromX, fromY: fromY, toX: toX, toY: toY)) {
		    						possibleMoves.append((fromX: fromX, fromY: fromY, toX: toX, toY: toY)) 
		    					}
		    				}
		    			}
		    		}
		    	}
	    	}

	    	for possibleMove in possibleMoves {
	    		responses = 0
	    		advancedGame.gameBoard = currentGame.gameBoard
	    		advancedGame.perform(move: possibleMove)
	    		for fromX in advancedGame.gameBoard {
	    			for fromY in advancedGame.gameBoard[fromX] {
	    				if advancedGame.gameBoard[fromX][fromY] == KonaneColor.black {
	    					for toX in advancedGame.gameBoard {
	    						for toY in advancedGame.gameBoard[toX] {
	    							if currentGame.isValid(move: (fromX: fromX, fromY: fromY, toX: toX, toY: toY)) {
		    							responses += 1
		    						}
	    						}
	    					}
	    				}
	    			}
	    		}
	    		if responses < bestResponse {
	    			bestResponse = responses
	    			bestMove = possibleMove
	    		}
	    	}
	    }
        return bestMove
	}
}