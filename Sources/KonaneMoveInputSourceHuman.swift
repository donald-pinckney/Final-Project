//
//  KonaneMoveInputSourceHuman.swift
//
//
//  Created by Alex Hill on 10/20/16.
//
//

import Foundation

class KonaneMoveInputSourceHuman: KonaneMoveInputSoure {

	override func removeFirstPiece(gameState: KonaneGameState) -> (x: Int, y: Int) {
		print("What is the first piece you'd like to remove?\nX:")
		var xCoor: Int = readline(()!)!
		print("Y:")
		var yCoor: Int = readline(()!)!
		return (x: xCoor, y: yCoor)
		// -> isValid(blackremove: ...)
	}
}
