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
	- width: Int = 16
	- height: Int = 16
	- init()
	- private internal board data storage
	- private isBlackTurn: Bool
	- getIsBlackTurn() -> Bool 
	- color(atX: Int, atY: Int) -> KonaneColor // Bottom left, 0-indexed
	- isValid(move: KonaneMove) -> Bool
	- isValid(blackRemove: (x: Int, y: Int)) -> Bool
	- isValid(whiteRemove: (x: Int, y: Int)) -> Bool
	- perform(move: KonaneMove)
	- perform(blackRemove: (x: Int, y: Int))
	- perform(whiteRemove: (x: Int, y: Int))
	- didBlackWin() -> Bool
	- didWhiteWin() -> Bool
*/

<<<<<<< HEAD

var width = 16
var height = 16
var colorBlack = "x"
var colorWhite = "o"
var gameBoard: [[String]] = []

for row in 0..<width {
    gameBoard.append([])
    gameBoard[row].append(String(row))
    for column in 0..<height {
        if row % 2 == 0 {
            if column % 2 == 0 {
                gameBoard[row].append(colorBlack)
=======
var width: Int = 16
var height: Int = 16
var gameBoard: [[KonaneColor]] = []

//Populates the board.
for column in 0..<width {
    gameBoard.append([]) //Each column is an array
    for row in 0..<height {
        if column % 2 == 0 { //If column even -> black first
            if row % 2 == 0 {
                gameBoard[column].append(KonaneColor.black)
>>>>>>> b76a6a9ddf2bf7cc27440e78fb3f1fb8bc7a3d2f
            }else{
                gameBoard[column].append(KonaneColor.white)
            }
        }else{
            if row % 2 == 0 { //If column odd -> white first
                gameBoard[column].append(KonaneColor.white)
            }else{
                gameBoard[column].append(KonaneColor.black)
            }
        }
    }
}

<<<<<<< HEAD
for ascii in gameBoard {
    print(ascii)
}
=======





//BEGIN code to print board (MAY BE MISSPLACED)
//Prints properly oriented and numbered board

for rowNumber in (0..<height).reversed() {
	//Print row numbering
	if rowNumber < 10 {
		print(" \(rowNumber)", terminator:" ")
	}
	else {
		print("\(rowNumber)", terminator:" ")
	}
	//Print actual board
	for columnNumber in 0..<width {
		if gameBoard[columnNumber][rowNumber] == KonaneColor.black {
			print("x", terminator: " ") //black square
		}
		else if gameBoard[columnNumber][rowNumber] == KonaneColor.white {
			print("o", terminator: " ") //white square
		}
		else {
			print(" ", terminator: " ") //empty square
		}
	}
	print()
}	
//Print column numbering
print("   ", terminator:"")
for columnNumber in 0..<width {
	if columnNumber < 10 {
		print("\(columnNumber)", terminator:" ")
	}
	else {
		print(columnNumber - 10, terminator:" ")
	}
}
print()
//END Code to print board
>>>>>>> b76a6a9ddf2bf7cc27440e78fb3f1fb8bc7a3d2f
