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
    	let currentGame = gameState.copy()

    	var advancedGame = gameState.copy()

    	var possibleMoves: [KonaneMove]
    	var responses: Int 
    	var bestResponse: Int = 1000000000 //Needs to be big
    	var bestMove: KonaneMove

    	if currentGame.getIsBlackTurn() {

	    	for fromX in 0..<currentGame.width {
	    		for fromY in 0..<currentGame.height {
		    		if currentGame.color(atX: fromX, atY: fromY) == KonaneColor.black {
		    			for toX in 0..<currentGame.width {
		    				for toY in 0..<currentGame.height {
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
	    		advancedGame = currentGame.copy()
	    		advancedGame.perform(move: possibleMove)
	    		for fromX in 0..<advancedGame.width {
	    			for fromY in 0..<advancedGame.height {
	    				if advancedGame.color(atX: fromX, atY: fromY) == KonaneColor.white {
	    					for toX in 0..<advancedGame.width {
	    						for toY in )..<advancedGame.height {
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

	    	for fromX in 0..<currentGame.width {
	    		for fromY in 0..<currentGame.height {
		    		if currentGame.color(atX: fromX, atY: fromY) == KonaneColor.white {
		    			for toX in 0..<currentGame.width {
		    				for toY in 0..<currentGame.height {
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
	    		advancedGame = currentGame.copy()
	    		advancedGame.perform(move: possibleMove)
	    		for fromX in 0..<advancedGame.width {
	    			for fromY in 0..<advancedGame.height {
	    				if advancedGame.color(atX: fromX, atY: fromY) == KonaneColor.black {
	    					for toX in 0..<advancedGame.width {
	    						for toY in )..<advancedGame.height {
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