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

