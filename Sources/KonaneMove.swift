//
//  KonaneMove.swift
//  
//
//  Created by Alex Hill on 10/20/16.
//
//

import Foundation

/*
KonaneMove
x	- init(fromX: Int, fromY: Int, toX: Int, toY: Int)
x	- fromX
x	- fromY
x	- toX
x	- toY
*/

class KonaneMove {

	let fromX: Int = 0
	let fromY: Int = 0
	let toX: Int = 0
	let toY: Int = 0

	init (fromX: Int, fromY: Int, toX: Int, toY: Int) {
		self.fromX = fromX
		self.fromY = fromY
		self.toX = toX
		self.toY = toY
	}
}

var myKonaneGameState = KonaneGameState.konaneGameState

//Actually programming a game move
//NOT WORKING YET ERRORS
func searchJumpPiece() {
    
    var searchTable: [[Int]] = []

    for column in myKonaneGameState.gameBoard {
        for row in myKonaneGameState.gameBoard[column] {
            if myKonaneGameState.isBlackTurn {
                if myKonaneGameState.gameBoard[column][row] == konaneColor.black {
                    searchTable.append([column, row])
                }
            }
            else if !myKonaneGameState.isBlackTurn {
                if myKonaneGameState.gameBoard[[column][row] == konaneColor.white {
                    searchTable.append([column, row])
                }
            }
        }
    }
}