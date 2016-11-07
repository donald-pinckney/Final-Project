//
//  KonaneMoveInputSourceHuman.swift
//
//
//  Created by Alex Hill on 10/20/16.
//
//

import Foundation

class KonaneMoveInputSourceHuman: KonaneMoveInputSource {

	override func removeFirstPiece(gameState: KonaneGameState) -> (x: Int, y: Int) {
		print("What is the first piece you'd like to remove?\nX:")
		let xCoor: Int = Int(readLine()!)!
		print("Y:")
		let yCoor: Int = Int(readLine()!)!
		return (x: xCoor, y: yCoor)
		// -> isValid(blackremove: ...)
	}
}
