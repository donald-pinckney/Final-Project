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
    case Int
}

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
var myKonaneGameState = konaneGameState(width: 16, height: 16, isBlackTurn: true)


//Alex's Ideas on how to create a game board


	//BEGIN Populate gameBoard.
	for column in 0..<myKonaneGameState.width {
    	myKonaneGameState.gameBoard.append([]) //Each column is an array
    	for row in 0..<myKonaneGameState.height {
        	if column % 2 == 0 { //If column even -> black first
            	if row % 2 == 0 {
                	myKonaneGameState.gameBoard[column].append(KonaneColor.black)
            	}
            	else {
                	myKonaneGameState.gameBoard[column].append(KonaneColor.white)
            	}
        	}
        	else {
            	if row % 2 == 0 { //If column odd -> white first
                myKonaneGameState.gameBoard[column].append(KonaneColor.white)
            	}
            	else {
                	myKonaneGameState.gameBoard[column].append(KonaneColor.black)
            	}
        	}
    	}
	}
	//END Populate gameBoard

	//BEGIN printGameBoard() (MAY BE MISSPLACED)
	//Prints properly oriented and numbered board
	func printGameBoard() {
    
        var arbitraryVariable = 0
        
    	for rowNumber in (0..<myKonaneGameState.height).reversed() {
		//Print row numbering
            if rowNumber < 10 {
                print(" \(rowNumber)", terminator:" ")
            }
            else {
			print("\(rowNumber)", terminator:" ")
            }
            //Print actual board
            for columnNumber in 0..<myKonaneGameState.width {
                if myKonaneGameState.gameBoard[columnNumber][rowNumber] == KonaneColor.black {
                    print("x ", terminator: " ") //black square
                }
                else if myKonaneGameState.gameBoard[columnNumber][rowNumber] == KonaneColor.white {
                    print("o ", terminator: " ") //white square
                }
                else {
                    print("  ", terminator: " ") //empty square
                }
            }
		print() //uses a terminator to make new line
		//Print column numbering
            
        }
        
		print("  ", terminator:"")
            while arbitraryVariable < myKonaneGameState.height {
                if arbitraryVariable < 10 {
                    print(" \(arbitraryVariable)", terminator: " ")
                } else {
                    print("\(arbitraryVariable)", terminator: " ")

                }
                arbitraryVariable += 1
            }

        print()
}
	//END printGameBoard()

	//BEGIN color()
	//Note: column -> X, row -> Y
	func color(atX: Int, atY: Int) -> KonaneColor {
		return myKonaneGameState.gameBoard[atX][atY]
		//MAY need to include more code 
		//As I am not entirely sure what this function is supposed to do.
	}
	//END color()


	//Function to print available pieces for removal
	func gameBoardPieceRomovalSearch(isBlackMove: Bool) -> [[Int]] {
    	var xCoord: Int = 0
    	var yCoord: Int = 0
    	var searchTable: [[Int]] = []
    	if isBlackMove {
        	while xCoord < myKonaneGameState.gameBoard.count {
            	while yCoord < myKonaneGameState.gameBoard[xCoord].count {
                	if myKonaneGameState.gameBoard[xCoord][yCoord] == KonaneGameState.KonaneColor.black {
                    	if xCoord + yCoord == 0 || xCoord == myKonaneGameState.width - 1 && yCoord == 0 || xCoord == 0 && yCoord == myKonaneGameState.height - 1 || xCoord == myKonaneGameState.width - 1 && yCoord == myKonaneGameState.height - 1 {
                        	searchTable.append([xCoord, yCoord])
                    	} else if xCoord == (myKonaneGameState.width/2) - 0 && yCoord == (myKonaneGameState.height/2) - 0 || xCoord == (myKonaneGameState.width/2) - 1  && yCoord == (myKonaneGameState.height/2) - 0 || xCoord == (myKonaneGameState.width/2) - 0 && yCoord == (myKonaneGameState.height/2) - 1 || xCoord == (myKonaneGameState.width/2) - 1 && yCoord == (myKonaneGameState.height/2) - 1 {
                        	searchTable.append([xCoord, yCoord])                    }
                		}
                	yCoord += 1
            	}
            	xCoord += 1
            	yCoord = 0
        	}
    	} else if !isBlackMove {
        	while xCoord < myKonaneGameState.gameBoard.count {
            	while yCoord < myKonaneGameState.gameBoard[xCoord].count {
                	if myKonaneGameState.gameBoard[xCoord][yCoord] == KonaneGameState.KonaneColor.white {
                    	if xCoord + yCoord == 0 || xCoord == myKonaneGameState.width - 1 && yCoord == 0 || xCoord == 0 && yCoord == myKonaneGameState.height - 1 || xCoord == myKonaneGameState.width - 1 && yCoord == myKonaneGameState.height - 1 {
                        	searchTable.append([xCoord, yCoord])
                    	} else if xCoord == (myKonaneGameState.width/2) - 0 && yCoord == (myKonaneGameState.height/2) - 0 || xCoord == (myKonaneGameState.width/2) - 1  && yCoord == (myKonaneGameState.height/2) - 0 || xCoord == (myKonaneGameState.width/2) - 0 && yCoord == (myKonaneGameState.height/2) - 1 || xCoord == (myKonaneGameState.width/2) - 1 && yCoord == (myKonaneGameState.height/2) - 1 {
                        	searchTable.append([xCoord, yCoord])
                    	}
                	}
                	yCoord += 1
            	}
            	xCoord += 1
            	yCoord = 0
        	}
    	}
    	return searchTable
	}


	func printPossiblePieceRemoval(isBlackMove:Bool) {
    	print("Thse are the positions of the removeable pieces are: \(gameBoardPieceRomovalSearch(isBlackMove: myKonaneGameState.isBlackTurn))")
	}



	//NOT CURRENTLY WORKING - Function to actually remove a piece on the Game Board

func RemovePiece() {
    
    print("What are the coordinates of the piece you want to remove? \(printPossiblePieceRemoval(isBlackMove: myKonaneGameState.isBlackTurn))")
    let xCoord = Int(readLine()!)!
    let yCoord = Int(readLine()!)!

    
    for index in gameBoardPieceRomovalSearch(isBlackMove: myKonaneGameState.isBlackTurn) {
        if [xCoord, yCoord] == index {
            if myKonaneGameState.isBlackTurn {
                if myKonaneGameState.gameBoard[xCoord][yCoord] == KonaneColor.black {
                    myKonaneGameState.gameBoard[xCoord][yCoord] = KonaneColor.empty
                } else {
                    print("The piece you tried to remove is not black")
                }
            }
            
            if !myKonaneGameState.isBlackTurn {
                if myKonaneGameState.gameBoard[xCoord][yCoord] == KonaneColor.white {
                    myKonaneGameState.gameBoard[xCoord][yCoord] = KonaneColor.empty
                } else {
                    print("The piece you tried to remove is not white")
                }
            }
            printGameBoard()
        }

        }
    }





RemovePiece()

