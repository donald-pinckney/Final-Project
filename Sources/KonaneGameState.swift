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
x	- getIsBlackTurn() -> Bool
x	- color(atX: Int, atY: Int) -> KonaneColor // Bottom left, 0-indexed
x	- isValid(move: KonaneMove) -> Bool
x	- isValid(blackRemove: (x: Int, y: Int)) -> Bool
x	- isValid(whiteRemove: (x: Int, y: Int)) -> Bool
x	- perform(move: KonaneMove)
x	- perform(blackRemove: (x: Int, y: Int))
x	- perform(whiteRemove: (x: Int, y: Int))
x	- didBlackWin() -> Bool
x	- didWhiteWin() -> Bool
*/

//WILL need to remove enum before build
//SINCE it is included in KonaneColor.swift
class GameState {

  var width: Int
	var height: Int
	private var isBlackTurn: Bool

    init (width: Int, height: Int, isBlackTurn: Bool) {
        self.width = width
        self.height = height
        self.isBlackTurn = isBlackTurn
    }

    private var gameBoard: [[KonaneColor]] = []

    func getIsBlackTurn() -> Bool {
    	if isBlackTurn {
    		return true
    	}
    	else {
    		return false
    	}
    }

    func color(atX: Int, atY: Int) -> KonaneColor {
    	return gameBoard[atX][atY]
    }

    //
    //ADD ALL ELSE STATEMENTS
    func isValid(move: KonaneMove) -> Bool {
        /* move returns 4 variables:
            move.fromX
            move.fromY
            move.toX
            move.toY

    	//WRITE
        // a move is valid if
           x - the the move.toX and move.toY is empty
           x - there is a piece between move.toX and move.toY and move.fromX and move.fromY
           x - include double jump
              x  - is there a piece between each jump
              x  - if it is a valid gameBoard place
              x  - the space to move to is empty
        */
        
        var returnBool = false
        
        if isBlackTurn {
            //How do I correctly access the gameBoard and the enum? - FIX
            //Check if this is a valid piece for the user to move
            if gameBoard[move.fromX][move.fromY] == KonaneColor.black {
                //Is this how I actually add values?
                //Checks if there is a place to move to
                //Checks for verticle cases
                if move.fromX == move.toX { //else done
                    if move.toY > move.fromY {
                        if gameBoard[move.fromX][move.fromY + 1] == KonaneColor.white && gameBoard[move.toX][move.toY] == KonaneColor.empty {
                            if abs(move.toX - move.fromX) == 4 || abs(move.toY - move.fromY) == 4 {
                                if gameBoard[move.toX][move.toY - 1] {
                                    returnBool = true
                                }
                            } else {
                                returnBool = true
                            }

                        }
                    } else if move.toY < move.fromY {
                        if gameBoard[move.fromX][move.fromY - 1] == KonaneColor.white && gameBoard[move.toX][move.toY] == KonaneColor.empty {
                            if abs(move.toX - move.fromX) == 4 || abs(move.toY - move.fromY) == 4 {
                                if gameBoard[move.toX][move.toY + 1] {
                                    returnBool = true
                                }
                            } else {
                                returnBool = true
                            }
                        }
                    }
                } else if move.fromY == move.toY {    //Checks for horizontal cases
                    if move.toX > move.fromX {
                        if gameBoard[move.fromX + 1][move.fromY] == KonaneColor.white && gameBoard[move.toX][move.toY] == KonaneColor.empty {
                            if abs(move.toX - move.fromX) == 4 || abs(move.toY - move.fromY) == 4 {
                                if gameBoard[move.toX - 1][move.toY] {
                                    returnBool = true
                                }
                            } else {
                                returnBool = true
                            }
                        }
                    } else if move.toX < move.fromX {
                        if gameBoard[move.fromX - 1][move.fromY] == KonaneColor.white && gameBoard[move.toX][move.toY] == KonaneColor.empty {
                            if abs(move.toX - move.fromX) == 4 || abs(move.toY - move.fromY) == 4 {
                                if gameBoard[move.toX + 1][move.toY] {
                                    returnBool = true
                                }
                            } else {
                                returnBool = true
                            }
                        }
                    }
                } else {
                    print("ERROR: COULD NOT ACCESS GAMEBOARD")
                }
            } else {
                print("This is not a black piece")
            }
        } else if !isBlackTurn {
            //How do I correctly access the gameBoard and the enum? - FIX
            //Check if this is a valid piece for the user to move
            if gameBoard[move.fromX][move.fromY] == KonaneColor.white {
                //Is this how I actually add values?
                //Checks if there is a place to move to
                //Checks for verticle direction
                if move.fromX == move.toX {
                    if move.toY > move.fromY {
                        if gameBoard[move.fromX][move.fromY + 1] == KonaneColor.black && gameBoard[move.toX][move.toY] == KonaneColor.empty {
                            if abs(move.toX - move.fromX) == 4 || abs(move.toY - move.fromY) == 4 {
                                if gameBoard[move.toX][move.toY - 1] {
                                    returnBool = true
                                }
                            } else {
                                returnBool = true
                            }

                        }
                    } else if move.toY < move.fromY {
                        if gameBoard[move.fromX][move.fromY - 1] == KonaneColor.black && gameBoard[move.toX][move.toY] == KonaneColor.empty {
                            if abs(move.toX - move.fromX) == 4 || abs(move.toY - move.fromY) == 4 {
                                if gameBoard[move.toX][move.toY + 1] {
                                    returnBool = true
                                }
                            } else {
                                returnBool = true
                            }
                        }
                    }
                } else if move.fromY == move.toY {
                    if move.toX > move.fromX {
                        if gameBoard[move.fromX + 1][move.fromY] == KonaneColor.black && gameBoard[move.toX][move.toY] == KonaneColor.empty {
                            if abs(move.toX - move.fromX) == 4 || abs(move.toY - move.fromY) == 4 {
                                if gameBoard[move.toX - 1][move.toY] {
                                    returnBool = true
                                }
                            } else {
                                returnBool = true
                            }
                        }
                    } else if move.toX < move.fromX {
                        if gameBoard[move.fromX - 1][move.fromY] == KonaneColor.black && gameBoard[move.toX][move.toY] == KonaneColor.empty {
                            if abs(move.toX - move.fromX) == 4 || abs(move.toY - move.fromY) == 4 {
                                if gameBoard[move.toX + 1][move.toY] {
                                    returnBool = true
                                }
                            } else {
                                returnBool = true
                            }
                        }
                    }
                }
            } else {
                print("It's not anyone's turn???")
            }
    	return returnBool
    }

    func isValid(blackRemove: (x: Int, y: Int)) -> Bool {
    	//WRITE

    	print("Does not work")
    	return true
    }

    func isValid(whiteRemove: (x: Int, y: Int)) -> Bool {
    	//WRITE

    	print("Does not work")
    	return true
    }

    func perform(move: KonaneMove) {
    	//WRITE

    	print("Does not work")
    }

    func perform(blackRemove: (x: Int, y: Int)) {
    	//WRITE

    	print("Does not work")
    }

    func perform(whiteRemove: (x: Int, y: Int)) {
    	//WRITE

    	print("Does not work")
    }

    func didBlackWin() -> Bool {
    	//WRITE

    	print("Does not work")
    	return false
    }

    func didWhiteWin() -> Bool {
    	//WRITE

    	print("Does not work")
    	return false
    }

}
