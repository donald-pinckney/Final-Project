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
x	- height - 1: Int = 16
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
class KonaneGameState {

    var width: Int
	var height: Int
    var isBlackTurn: Bool

    init (width: Int, height: Int, isBlackTurn: Bool) {
        self.width = width
        self.height = height
        self.isBlackTurn = isBlackTurn
    }

    public var gameBoard: [[KonaneColor]] = []

    func populateGameBoard() {
        for column in 0..<width {
            gameBoard.append([]) //Each column is an array
            for row in 0..<height{
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
    }

    func getIsBlackTurn() -> Bool {
    	if isBlackTurn == true{
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
        /*
            Criteria for this function
        */
        
        /* Criteria:
        - Is the place to jump to within the gameBoard?
        
        move returns 4 variables:
        move.fromX
        move.fromY
        move.toX
        move.toY
        
        // a move is valid if
        x - the the move.toX and move.toY is empty
        x - there is a piece between move.toX and move.toY and move.fromX and move.fromY
        x - include double jump
        x  - is there a piece between each jump
        x  - if it is a valid gameBoard place
        x  - the space to move to is empty
        */
        var returnBool = false
        if isBlackTurn == true {
            //How do I correctly access the gameBoard and the enum? - FIX
            //Check if this is a valid piece for the user to move
            if gameBoard[move.fromX][move.fromY] == KonaneColor.black {
                //Is this how I actually add values?
                //Checks if there is a place to move to
                //Checks for verticle direction
                if move.fromX == move.toX {
                    if move.toY > move.fromY {
                        if gameBoard[move.fromX][move.fromY + 1] == KonaneColor.white && gameBoard[move.toX][move.toY] == KonaneColor.empty {
                            if abs(move.toX - move.fromX) == 4 || abs(move.toY - move.fromY) == 4 {
                                if gameBoard[move.toX][move.toY - 1] == KonaneColor.white {
                                    returnBool = true
                                }
                            } else {
                                returnBool = true
                            }
                            
                        }
                    } else if move.toY < move.fromY {
                        if gameBoard[move.fromX][move.fromY - 1] == KonaneColor.white && gameBoard[move.toX][move.toY] == KonaneColor.empty {
                            if abs(move.toX - move.fromX) == 4 || abs(move.toY - move.fromY) == 4 {
                                if gameBoard[move.toX][move.toY + 1] == KonaneColor.white {
                                    returnBool = true
                                }
                            } else {
                                returnBool = true
                            }
                        }
                    }
                } else if move.fromY == move.toY {
                    if move.toX > move.fromX {
                        if gameBoard[move.fromX + 1][move.fromY] == KonaneColor.white && gameBoard[move.toX][move.toY] == KonaneColor.empty {
                            if abs(move.toX - move.fromX) == 4 || abs(move.toY - move.fromY) == 4 {
                                if gameBoard[move.toX - 1][move.toY] == KonaneColor.white {
                                    returnBool = true
                                }
                            } else {
                                returnBool = true
                            }
                        }
                    } else if move.toX < move.fromX {
                        if gameBoard[move.fromX - 1][move.fromY] == KonaneColor.white && gameBoard[move.toX][move.toY] == KonaneColor.empty {
                            if abs(move.toX - move.fromX) == 4 || abs(move.toY - move.fromY) == 4 {
                                if gameBoard[move.toX + 1][move.toY] == KonaneColor.white {
                                    returnBool = true
                                }
                            } else {
                                returnBool = true
                            }
                        }
                    }
                }
            }
        } else if isBlackTurn == false{
            //Check if this is a valid piece for the user to move
            if gameBoard[move.fromX][move.fromY] == KonaneColor.white {
                //Is this how I actually add values?
                //Checks if there is a place to move to
                //Checks for verticle direction
                if move.fromX == move.toX {
                    if move.toY > move.fromY {
                        if gameBoard[move.fromX][move.fromY + 1] == KonaneColor.black && gameBoard[move.toX][move.toY] == KonaneColor.empty {
                            if abs(move.toX - move.fromX) == 4 || abs(move.toY - move.fromY) == 4 {
                                if gameBoard[move.toX][move.toY - 1] == KonaneColor.black {
                                    returnBool = true
                                }
                            } else {
                                returnBool = true
                            }
                            
                        }
                    } else if move.toY < move.fromY {
                        if gameBoard[move.fromX][move.fromY - 1] == KonaneColor.black && gameBoard[move.toX][move.toY] == KonaneColor.empty {
                            if abs(move.toX - move.fromX) == 4 || abs(move.toY - move.fromY) == 4 {
                                if gameBoard[move.toX][move.toY + 1] == KonaneColor.black {
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
                                if gameBoard[move.toX - 1][move.toY] == KonaneColor.black {
                                    returnBool = true
                                }
                            } else {
                                returnBool = true
                            }
                        }
                    } else if move.toX < move.fromX {
                        if gameBoard[move.fromX - 1][move.fromY] == KonaneColor.black && gameBoard[move.toX][move.toY] == KonaneColor.empty {
                            if abs(move.toX - move.fromX) == 4 || abs(move.toY - move.fromY) == 4 {
                                if gameBoard[move.toX + 1][move.toY] == KonaneColor.black {
                                    returnBool = true
                                }
                            } else {
                                returnBool = true
                            }
                        }
                    }
                }
            }
        }
        return returnBool
    }
    //Done?
    func isValid(blackRemove: (x: Int, y: Int)) -> Bool {
        var returnBool = false
        if isBlackTurn == true{
            for column in 0..<width {
                for row in 0..<height {
                    if gameBoard[column][row] == KonaneColor.black {
                        if blackRemove.x + blackRemove.y == 0 || blackRemove.x == width - 1 && blackRemove.y == 0 || blackRemove.x == 0 && blackRemove.y == height - 1 || blackRemove.x == width - 1 && blackRemove.y == height - 1{
                            if gameBoard[blackRemove.x][blackRemove.y] == KonaneColor.black {
                                returnBool = true
                            } else {
                                print("error: that is not a black tile")
                            }
                        } else if blackRemove.x == (width/2) - 0 && blackRemove.y == (height/2) - 0 || blackRemove.x == (width/2) - 1  && blackRemove.y == (height/2) - 0 || blackRemove.x == (width/2) - 0 && blackRemove.y == (height/2) - 1 || blackRemove.x == (width/2) - 1 && blackRemove.y == (height/2) - 1 {
                                if gameBoard[blackRemove.x][blackRemove.y] == KonaneColor.black {
                                returnBool = true
                                } else {
                                print("error: that is not a black tile")
                            }
                        }
                    }
                }
            }
        }
        return returnBool
    }
    //Done?
    //Checking the index value of an array that does not exist
    func isValid(whiteRemove: (x: Int, y: Int)) -> Bool {
        if gameBoard[whiteRemove.x][whiteRemove.y] == KonaneColor.white {
            //If the piece chosen is not in the left bottom corner, only test up and right
            if whiteRemove.x == 0 && whiteRemove.y == 0 {
                if gameBoard[whiteRemove.x + 1][whiteRemove.y] == KonaneColor.empty || gameBoard[whiteRemove.x][whiteRemove.y + 1] == KonaneColor.empty {
                    return true
                } // if the piece is in the top left corner, only test down and right
            } else if whiteRemove.x == 0 && whiteRemove.y == height - 1 {
                if gameBoard[whiteRemove.x + 1][whiteRemove.y] == KonaneColor.empty || gameBoard[whiteRemove.x][whiteRemove.y - 1] == KonaneColor.empty {
                return true
                }
            } else if whiteRemove.x == width - 1 && whiteRemove.y == height - 1{
                if gameBoard[whiteRemove.x][whiteRemove.y - 1] == KonaneColor.empty || gameBoard[whiteRemove.x - 1][whiteRemove.y] == KonaneColor.empty {
                    return true
                }
            } else if whiteRemove.x == width - 1 && whiteRemove.y == 0 {
                if gameBoard[whiteRemove.x][whiteRemove.y + 1] == KonaneColor.empty {
                    return true
                }
            } else if whiteRemove.x < 1 {
                if gameBoard[whiteRemove.x + 1][whiteRemove.y] == KonaneColor.empty || gameBoard[whiteRemove.x][whiteRemove.y + 1] == KonaneColor.empty || gameBoard[whiteRemove.x][whiteRemove.y - 1] == KonaneColor.empty {
                    return true
                }
            } else if whiteRemove.x > 14 {
                if gameBoard[whiteRemove.x - 1][whiteRemove.y] == KonaneColor.empty || gameBoard[whiteRemove.x][whiteRemove.y + 1] == KonaneColor.empty || gameBoard[whiteRemove.x][whiteRemove.y - 1] == KonaneColor.empty {
                    return true
                }
            } else if whiteRemove.y < 1 {
                if gameBoard[whiteRemove.x][whiteRemove.y + 1] == KonaneColor.empty || gameBoard[whiteRemove.x + 1][whiteRemove.y] == KonaneColor.empty || gameBoard[whiteRemove.x - 1][whiteRemove.y] == KonaneColor.empty {
                    return true
                }
            } else if whiteRemove.y > 14 {
                if gameBoard[whiteRemove.x][whiteRemove.y - 1] == KonaneColor.empty || gameBoard[whiteRemove.x + 1][whiteRemove.y] == KonaneColor.empty || gameBoard[whiteRemove.x - 1][whiteRemove.y] == KonaneColor.empty {
                    return true
                }
            } else {
                print("Not a valid piece to remove")
                return false
            }
        } else {
            print("error with checking spaces around tile")
        return false
        }
        print("That is not a white piece")
        return false
    }

    func perform(move: KonaneMove) {

        if isValid(move: move) {
            gameBoard[move.fromX][move.fromY] = KonaneColor.empty
            if isBlackTurn == true{
                gameBoard[move.toX][move.toY] = KonaneColor.black
                if move.fromX == move.toX {
                    if move.toY > move.fromY {
                        gameBoard[move.toX][move.toY - 1] = KonaneColor.empty
                        if abs(move.toY - move.fromY) == 4 {
                            gameBoard[move.toX][move.fromY + 1] = KonaneColor.empty
                        }
                    } else {
                        gameBoard[move.toX][move.toY + 1] = KonaneColor.empty
                        if abs(move.toY - move.fromY) == 4 {
                            gameBoard[move.toX][move.fromY - 1] = KonaneColor.empty
                        }
                    }
                } else {
                    if move.toX > move.fromX {
                        gameBoard[move.toX - 1][move.toY] = KonaneColor.empty
                        if abs(move.toX - move.fromX) == 4 {
                            gameBoard[move.fromX + 1][move.fromY] = KonaneColor.empty
                        }
                    } else {
                        gameBoard[move.toX + 1][move.toY] = KonaneColor.empty
                        if abs(move.toX - move.fromX) == 4 {
                            gameBoard[move.fromX - 1][move.fromY] = KonaneColor.empty
                        }
                    }
                }
            } else if isBlackTurn == false{
                gameBoard[move.toX][move.toY] = KonaneColor.white
                if move.fromX == move.toX {
                    if move.toY > move.fromY {
                        gameBoard[move.toX][move.toY - 1] = KonaneColor.empty
                        if abs(move.toY - move.fromY) == 4 {
                            gameBoard[move.toX][move.fromY + 1] = KonaneColor.empty
                        }
                    } else {
                        gameBoard[move.toX][move.toY + 1] = KonaneColor.empty
                        if abs(move.toY - move.fromY) == 4 {
                            gameBoard[move.toX][move.fromY - 1] = KonaneColor.empty
                        }
                    }
                } else {
                    if move.toX > move.fromX {
                        gameBoard[move.toX - 1][move.toY] = KonaneColor.empty
                        if abs(move.toX - move.fromX) == 4 {
                            gameBoard[move.fromX + 1][move.fromY] = KonaneColor.empty
                        }
                    } else {
                        gameBoard[move.toX + 1][move.toY] = KonaneColor.empty
                        if abs(move.toX - move.fromX) == 4 {
                            gameBoard[move.fromX - 1][move.fromY] = KonaneColor.empty
                        }
                    }
                }
            } else {
                print("Error in perform(move:) function")
            }
        }

    }

    func perform(blackRemove: (x: Int, y: Int)) {
        if isValid(blackRemove: (x: blackRemove.x, y: blackRemove.y)) {
            gameBoard[blackRemove.x][blackRemove.y] = KonaneColor.empty
        }
    }

    func perform(whiteRemove: (x: Int, y: Int)) {
        if isValid(whiteRemove: (x: whiteRemove.x, y: whiteRemove.y)) {
            gameBoard[whiteRemove.x][whiteRemove.y] = KonaneColor.empty
        } else {
            print("error")
        }
    }

    
    
    //FIX FIX FIX FIX FIX
    //I think when the code tries to access a number that is not in the array, for example -2 identifier, the code cannot handle it.
    func didBlackWin() -> Bool {
        var returnBool = true
        for column in 0..<width {
            for row in 0..<height {
                if isBlackTurn == true {
                    if 1 < row && row < 14 && 1 < column && column < 13 {
                        if gameBoard[column][row] == KonaneColor.black {
                            if gameBoard[column + 1][row] == KonaneColor.white && gameBoard[column + 2][row] == KonaneColor.empty{
                                returnBool = false
                            } else if gameBoard[column - 1][row] == KonaneColor.white && gameBoard[column - 2][row] == KonaneColor.empty{
                                returnBool = false
                            } else if gameBoard[column][row + 1] == KonaneColor.white && gameBoard[column][row + 2] == KonaneColor.empty{
                                returnBool = false
                            } else if gameBoard[column][row - 1] == KonaneColor.white && gameBoard[column][row - 2] == KonaneColor.empty {
                                returnBool = false
                            }
                        }
                    } else if column < 1 {
                        if gameBoard[column + 1][row] == KonaneColor.white && gameBoard[column + 2][row] ==  KonaneColor.empty {
                            returnBool = false
                        }
                    } else if column > 14 {
                        if gameBoard[column - 1][row] == KonaneColor.white && gameBoard[column - 2][row] ==  KonaneColor.empty {
                            returnBool = false
                        }
                    } else if row < 1 {
                        if gameBoard[column][row + 1] == KonaneColor.white && gameBoard[column][row + 2] ==  KonaneColor.empty {
                            returnBool = false
                        }
                    } else if row > 14 {
                        if gameBoard[column][row - 1] == KonaneColor.white && gameBoard[column][row - 2] ==  KonaneColor.empty {
                            returnBool = false
                        }
                    } else {
                    }
                }
            }
        }
        return returnBool
    }

    func didWhiteWin() -> Bool {
        var returnBool = true
        for column in 0..<width {
            for row in 0..<height {
                if isBlackTurn == false {
                    if 1 < row && row < 13 && 1 < column && column < 13 {
                        if gameBoard[column][row] == KonaneColor.black {
                            if gameBoard[column + 1][row] == KonaneColor.white && gameBoard[column + 2][row] == KonaneColor.empty{
                                returnBool = false
                            } else if gameBoard[column - 1][row] == KonaneColor.black && gameBoard[column - 2][row] == KonaneColor.empty{
                                returnBool = false
                            } else if gameBoard[column][row + 1] == KonaneColor.black && gameBoard[column][row + 2] == KonaneColor.empty{
                                returnBool = false
                            } else if gameBoard[column][row - 1] == KonaneColor.black && gameBoard[column][row - 2] == KonaneColor.empty {
                                returnBool = false
                            }
                        }
                    } else if column < 1 {
                        if gameBoard[column + 1][row] == KonaneColor.black && gameBoard[column + 2][row] ==  KonaneColor.empty {
                            returnBool = false
                        }
                    } else if column > 14 {
                        if gameBoard[column - 1][row] == KonaneColor.black && gameBoard[column - 2][row] ==  KonaneColor.empty {
                            returnBool = false
                        }
                    } else if row < 1 {
                        if gameBoard[column][row + 1] == KonaneColor.black && gameBoard[column][row + 2] ==  KonaneColor.empty {
                            returnBool = false
                        }
                    } else if row > 14 {
                        if gameBoard[column][row - 1] == KonaneColor.black && gameBoard[column][row - 2] ==  KonaneColor.empty {
                            returnBool = false
                        }
                    } else {                    }
                }
            }
        }
        return returnBool
    }
}
