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

	func removeFirstPiece(gameState: KonaneGameState) -> (x: Int, y: Int) {
		//WRITE CODE
	}

	func removeSecondPiece(gameState: KonaneGameState) -> (x: Int, y: Int) {
		//WRITE CODE
	}

	func nextMove(gameState: KonaneGameState) -> KonaneMove {
		//WRITE CODE
	}
}

