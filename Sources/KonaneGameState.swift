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
enum KonaneColor {
    case black, white, empty
}

class KonaneGameState {

	private var width: Int = 16
	private var height: Int = 16
	private var gameBoard: [[KonaneColor]] = []
	private var isBlackTurn: Bool = true

	init (width: Int, height: Int, isBlackTurn:)

	//BEGIN Populate gameBoard.
	for column in 0..<width {
    	gameBoard.append([]) //Each column is an array
    	for row in 0..<height {
        	if column % 2 == 0 { //If column even -> black first
            	if row % 2 == 0 {
                	gameBoard[column].append(KonaneColor.black)
            	}
            	else {
                	gameBoard[column].append(KonaneColor.white)
            	}
        	}
        	else {
            	if row % 2 == 0 { //If column odd -> white first
                gameBoard[column].append(KonaneColor.white)
            	}
            	else {
                	gameBoard[column].append(KonaneColor.black)
            	}
        	}
    	}
	}
	//END Populate gameBoard

	//BEGIN printGameBoard() (MAY BE MISSPLACED)
	//Prints properly oriented and numbered board
	func printGameBoard() {
    
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
	}
	//END printGameBoard()

	//BEGIN color()
	//Note: column -> X, row -> Y
	func color(atX: Int, atY: Int) -> KonaneColor {
		return gameBoard[atX][atY]
		//MAY need to include more code 
		//As I am not entirely sure what this function is supposed to do.
	}
	//END color()


	//Function to print available pieces for removal
	func gameBoardPieceRomovalSearch(isBlackMove: Bool) -> [[Int]] {
    	var genericInt: Int = 0
    	var secondGenericInt: Int = 0
    	var searchTable: [[Int]] = []
    	if isBlackMove {
        	while genericInt < gameBoard.count {
            	while secondGenericInt < gameBoard[genericInt].count {
                	if gameBoard[genericInt][secondGenericInt] == KonaneGameState.KonaneColor.black {
                    	if genericInt + secondGenericInt == 0 || genericInt == width - 1 && secondGenericInt == 0 || genericInt == 0 && secondGenericInt == height - 1 || genericInt == width - 1 && secondGenericInt == height - 1 {
                        	searchTable.append([genericInt, secondGenericInt])
                    	} else if genericInt == (width/2) - 0 && secondGenericInt == (height/2) - 0 || genericInt == (width/2) - 1  && secondGenericInt == (height/2) - 0 || genericInt == (width/2) - 0 && secondGenericInt == (height/2) - 1 || genericInt == (width/2) - 1 && secondGenericInt == (height/2) - 1 {
                        	searchTable.append([genericInt, secondGenericInt])                    }
                		}
                	secondGenericInt += 1
            	}
            	genericInt += 1
            	secondGenericInt = 0
        	}
    	} else if !isBlackMove {
        	while genericInt < gameBoard.count {
            	while secondGenericInt < gameBoard[genericInt].count {
                	if gameBoard[genericInt][secondGenericInt] == KonaneGameState.KonaneColor.white {
                    	if genericInt + secondGenericInt == 0 || genericInt == width - 1 && secondGenericInt == 0 || genericInt == 0 && secondGenericInt == height - 1 || genericInt == width - 1 && secondGenericInt == height - 1 {
                        	searchTable.append([genericInt, secondGenericInt])
                    	} else if genericInt == (width/2) - 0 && secondGenericInt == (height/2) - 0 || genericInt == (width/2) - 1  && secondGenericInt == (height/2) - 0 || genericInt == (width/2) - 0 && secondGenericInt == (height/2) - 1 || genericInt == (width/2) - 1 && secondGenericInt == (height/2) - 1 {
                        	searchTable.append([genericInt, secondGenericInt])
                    	}
                	}
                	secondGenericInt += 1
            	}
            	genericInt += 1
            	secondGenericInt = 0
        	}
    	}
    	return searchTable
	}


	func printPossiblePieceRemoval(isBlackMove:Bool) {
    	print("These are the coordinates of the pieces you may remove in the format [Row, Column] \(gameBoardPieceRomovalSearch(isBlackMove: isBlackMove))")
	}



	//NOT CURRENTLY WORKING - Function to actually remove a piece on the Game Board
	/*
	func RemovePiece() {
	    print("Enter the y coordinate of the piece you want to remove")
	    let yCoord = Int(readLine()!)
	    print("Enter the x coordinate of the piece you want to remove")
	    let xCoord = Int(readLine()!)
	    let pieceToBeRemoved = [yCoord, xCoord]
	    for table in gameBoardPieceRomovalSearch(isBlackMove:true) {
	        if pieceToBeRemoved == table {
	            gameBoard[yCoord][xCoord] = " "
	        }
	    }
	}

	*/


	printPossiblePieceRemoval(isBlackMove: false)
	printPossiblePieceRemoval(isBlackMove: true)
}