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

enum KonaneColor {
    case black, white, empty
}
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
//>>>>>>> b76a6a9ddf2bf7cc27440e78fb3f1fb8bc7a3d2f
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




//BEGIN code to print board (MAY BE MISSPLACED)
//Prints properly oriented and numbered board

//Made the print a function
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
//>>>>>>> b76a6a9ddf2bf7cc27440e78fb3f1fb8bc7a3d2f
}

//Function to print available pieces for removal
func pieceRomovalSearch() {
    var genericInt: Int = 0
    var secondGenericInt: Int = 0
    let isBlackMove = true //remove this once func is implimented
    var searchTable: [[String]] = []
    if isBlackMove {
        while genericInt < gameBoard.count {
            while secondGenericInt < gameBoard[genericInt].count {
                if gameBoard[genericInt][secondGenericInt] == KonaneGameState.KonaneColor.black {
                    if genericInt + secondGenericInt == 0 || genericInt == width - 1 && secondGenericInt == 0 || genericInt == 0 && secondGenericInt == height - 1 || genericInt == width - 1 && secondGenericInt == height - 1 {
                        searchTable.append(["Row: \(genericInt), Column: \(secondGenericInt)"])
                    } else if genericInt == (width/2) - 0 && secondGenericInt == (height/2) - 0 || genericInt == (width/2) - 1  && secondGenericInt == (height/2) - 0 || genericInt == (width/2) - 0 && secondGenericInt == (height/2) - 1 || genericInt == (width/2) - 1 && secondGenericInt == (height/2) - 1 {
                        searchTable.append(["Row: \(genericInt), Column: \(secondGenericInt)"])
                    }
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
                        searchTable.append(["Row: \(genericInt), Column: \(secondGenericInt)"])
                    } else if genericInt == (width/2) - 0 && secondGenericInt == (height/2) - 0 || genericInt == (width/2) - 1  && secondGenericInt == (height/2) - 0 || genericInt == (width/2) - 0 && secondGenericInt == (height/2) - 1 || genericInt == (width/2) - 1 && secondGenericInt == (height/2) - 1 {
                        searchTable.append(["Row: \(genericInt), Column: \(secondGenericInt)"])
                    }
                }
                secondGenericInt += 1
            }
            genericInt += 1
            secondGenericInt = 0
        }
    }
        print("These are the pieces available for removal: \(searchTable)")
}

func pieceRomoval() {
    var genericInt: Int = 0
    var secondGenericInt: Int = 0
    let isBlackMove = true //remove this once func is implimented
    var searchTable: [[String]] = []
    if isBlackMove {
        while genericInt < gameBoard.count {
            while secondGenericInt < gameBoard[genericInt].count {
                if gameBoard[genericInt][secondGenericInt] == KonaneGameState.KonaneColor.black {
                    if genericInt + secondGenericInt == 0 || genericInt == width - 1 && secondGenericInt == 0 || genericInt == 0 && secondGenericInt == height - 1 || genericInt == width - 1 && secondGenericInt == height - 1 {
                        searchTable.append(["Row: \(genericInt), Column: \(secondGenericInt)"])
                    } else if genericInt == (width/2) - 0 && secondGenericInt == (height/2) - 0 || genericInt == (width/2) - 1  && secondGenericInt == (height/2) - 0 || genericInt == (width/2) - 0 && secondGenericInt == (height/2) - 1 || genericInt == (width/2) - 1 && secondGenericInt == (height/2) - 1 {
                        searchTable.append(["Row: \(genericInt), Column: \(secondGenericInt)"])
                    }
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
                        searchTable.append(["Row: \(genericInt), Column: \(secondGenericInt)"])
                    } else if genericInt == (width/2) - 0 && secondGenericInt == (height/2) - 0 || genericInt == (width/2) - 1  && secondGenericInt == (height/2) - 0 || genericInt == (width/2) - 0 && secondGenericInt == (height/2) - 1 || genericInt == (width/2) - 1 && secondGenericInt == (height/2) - 1 {
                        searchTable.append(["Row: \(genericInt), Column: \(secondGenericInt)"])
                    }
                }
                secondGenericInt += 1
            }
            genericInt += 1
            secondGenericInt = 0
        }
    }
    print("What are the coordinates of the piece you want to remove?")
    for possibleRemovablePieces in searchTable {
        print("Print your y coordinate")
        let yCoord = Int(readLine()!)
        print("Print your x coordinate")
        let xCoord = Int(readLine()!)
        if ["Row: \(yCoord), Column: \(xCoord)"] == possibleRemovablePieces {
            gameBoard[yCoord][xCoord] = KonaneGameState.KonaneColor.empty
        }
    }
}




printGameBoard()
pieceRomovalSearch()
pieceRomoval()
printGameBoard()



