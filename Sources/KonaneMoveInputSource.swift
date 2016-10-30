//
//  KonaneMoveInputSource.swift
//
//
//  Created by Alex Hill on 10/20/16.
//
//

import Foundation

/*
KonaneMoveInputSource
- init(isBlack: Bool)
- isBlack
- removeFirstPiece(gameState: KonaneGameState) -> (x: Int, y: Int) (should override)
- removeSecondPiece(gameState: KonaneGameState) -> (x: Int, y: Int) (should override)
- nextMove(gameState: KonaneGameState) -> KonaneMove

Subclasses:
KonaneMoveInputSourceHuman
[TeamName]_KonaneMoveInputSourceAI
*/

class KonaneMoveInputSource {
	var isBlack: Bool

	init(isBlack: Bool) {
		self.isBlack = isBlack
	}
		// Placeholder functions defined in subclasses
	func removeFirstPiece(gameState: KonaneGameState) -> (x: Int, y: Int) {
		return(x: 1, y: 1)
	}

	func removeSecondPiece(gameState: KonaneGameState) -> (x: Int, y: Int) {
		return(x: 1, y: 1)
	}

	func nextMove(gameState: KonaneGameState) -> KonaneMove {
		var move = KonaneMove(fromX: 1, fromY: 1, toX: 1, toY: 1)
		return(move)
	}
}
