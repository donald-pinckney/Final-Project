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
    }

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
      return true
    }
    //Done?
    func isValid(blackRemove: (x: Int, y: Int)) -> Bool {
        var returnBool = false
        if isBlackTurn {
            for column in 0..<width {
                for row in 0..<height {
                    if gameBoard[column][row] == KonaneColor.black {
                        if blackRemove.x + blackRemove.y == 0 || blackRemove.x == width - 1 && blackRemove.y == 0 || blackRemove.x == 0 && blackRemove.y == height - 1 || blackRemove.x == width - 1 && blackRemove.y == height - 1 {
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
    func isValid(whiteRemove: (x: Int, y: Int)) -> Bool {
        if gameBoard[whiteRemove.x][whiteRemove.y] == KonaneColor.white {
          if gameBoard[whiteRemove.x - 1][whiteRemove.y] == KonaneColor.empty {
            return true
          } else if gameBoard[whiteRemove.x + 1][whiteRemove.y] == KonaneColor.empty {
            return true
          } else if gameBoard[whiteRemove.x][whiteRemove.y - 1] == KonaneColor.empty {
            return true
          } else if gameBoard[whiteRemove.x][whiteRemove.y + 1] == KonaneColor.empty {
            return true
          } else {
            print("error with checking spaces around tile")

            return false
          }
        } else {
            print("error not white tile")

          return false
        }
    }

    func perform(move: KonaneMove) {

        //WRITE
    	print("Does not work")
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
