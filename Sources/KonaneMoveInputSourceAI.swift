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

	override func nextMove(gameState: KonaneGameState) -> KonaneMove {
		//Code	
		var moves = possibleMoves(gameState)
	}	

	func possibleMoves(gameState: KonaneGameState) -> [KonaneMove] {

		var playerColor: KonaneColor
		var opponentColor: KonaneColor

		if isBlack {
			playerColor = KonaneColor.black
			opponentColor = KonaneColor.white
		} 
		else {
			playerColor = KonaneColor.white
			opponentColor = KonaneColor.black
		}

		for xCoord in gameState.width {
			for yCoord in gameState.height {
				if gameState[xCoord][yCoord] == playerColor {
					var moves = [KonaneMove]
					for i in xCoord.stride(to: gameState.width, by:2) {
						if gameState[i][yCoord] == KonaneColor.empty {
							moves.append(KonaneMove(xCoord, yCoord, i, yCoord))
						} else {
							break
						}
					}

					for i in (0.stride(to: xCoord, by: 2)).reversed() {
						if gameState[i][yCoord] == Konanecolor.empty {
							moves.append(KonaneMove(xCoord, yCoord, i, xCoord))
						} else {
							break
						}
					}

					for i in yCoord.stride(to: gameState.height, by: 2) {
						if gameState[xCoord][i] == KonaneColor.empty {
							moves.append(KonaneMove(xCoord, yCoord, xCoord, i))
						} else {
							break
						}
					}

					for i in (yCoord.stride(to: gameState.height, by: 2)).reversed() {
						if gameState[xCoord][i] == KonaneColor.empty {
							moves.append(KonaneMove(xCoord, yCoord, xCoord, i))
						} else {
							break
						}
					}
				}
			}
		}
		return moves
	}
}