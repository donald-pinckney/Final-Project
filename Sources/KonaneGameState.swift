//
//  KonaneGameState.swift
//  
//
//  Created by Alex Hill on 10/20/16.
//  
//

import Foundation

/*
15  o  x  o  x  o  x  o  x  o  x  o  x  o  x  o  x
14  x  o  x  o  x  o  x  o  x  o  x  o  x  o  x  o
13  o  x  o  x  o  x  o  x  o  x  o  x  o  x  o  x
12  x  o  x  o  x  o  x  o  x  o  x  o  x  o  x  o
11  o  x  o  x  o  x  o  x  o  x  o  x  o  x  o  x
10  x  o  x  o  x  o  x  o  x  o  x  o  x  o  x  o
9   o  x  o  x  o  x  o  x  o  x  o  x  o  x  o  x
8   x  o  x  o  x  o  x  o  x  o  x  o  x  o  x  o
7   o  x  o  x  o  x  o  x  o  x  o  x  o  x  o  x
6   x  o  x  o  x  o  x  o  x  o  x  o  x  o  x  o
5   o  x  o  x  o  x  o  x  o  x  o  x  o  x  o  x
4   x  o  x  o  x  o  x  o  x  o  x  o  x  o  x  o
3   o  x  o  x  o  x  o  x  o  x  o  x  o  x  o  x
2   x  o  x  o  x  o  x  o  x  o  x  o  x  o  x  o
1   o  x  o  x  o  x  o  x  o  x  o  x  o  x  o  x
0   x  o  x  o  x  o  x  o  x  o  x  o  x  o  x  o

    0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15

KonaneGameState
x	- width: Int = 16
x	- height: Int = 16
x	- init()
x	- private internal board data storage
x	- private isBlackTurn: Bool
	- getIsBlackTurn() -> Bool 
x	- color(atX: Int, atY: Int) -> KonaneColor // Bottom left, 0-indexed
	- isValid(move: KonaneMove) -> Bool
	- isValid(blackRemove: (x: Int, y: Int)) -> Bool
	- isValid(whiteRemove: (x: Int, y: Int)) -> Bool
	- perform(move: KonaneMove)
	- perform(blackRemove: (x: Int, y: Int))
	- perform(whiteRemove: (x: Int, y: Int))
	- didBlackWin() -> Bool
	- didWhiteWin() -> Bool
*/

//WILL need to remove enum before build
//SINCE it is included in KonaneColor.swift
class konaneGameState {

    var width: Int
	var height: Int
	var gameBoard: [[KonaneColor]] = []
	var isBlackTurn: Bool

    init (width: Int, height: Int, isBlackTurn:Bool) {
        self.width = width
        self.height = height
        self.isBlackTurn = isBlackTurn
    }
}




//Initialized an instance of konaneGameState
var myKonaneGameState = konaneGameState(width: 16, height: 16, isBlackTurn: false)


//Alex's Ideas on how to create a game board







