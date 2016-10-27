//
//  KonaneMoveInputSourceHuman.swift
//  
//
//  Created by Alex Hill on 10/20/16.
//
//

import Foundation

//Code for first removal of pieces

func gameBoardPieceRomovalSearch() -> [[Int]] {
    var xCoord: Int = 0
    var yCoord: Int = 0
    var searchTable: [[Int]] = []
    if myKonaneGameState.isBlackTurn {
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
    } else if !myKonaneGameState.isBlackTurn {
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

//IT WORKS - Function to remove a piece on the game board
func RemovePiece() {
    
    print("What are the coordinates of the piece you want to remove? \(gameBoardPieceRomovalSearch())")
    let xCoord = Int(readLine()!)!
    let yCoord = Int(readLine()!)!
    var errorBool = true
    
    print()
    
    for index in gameBoardPieceRomovalSearch() {
        if [xCoord, yCoord] == index {
            errorBool = false
            if myKonaneGameState.isBlackTurn {
                if myKonaneGameState.gameBoard[xCoord][yCoord] == KonaneColor.black {
                    myKonaneGameState.gameBoard[xCoord][yCoord] = KonaneColor.empty
                    printGameBoard()
                    break
                }
            }
            
            if !myKonaneGameState.isBlackTurn {
                errorBool = false
                if myKonaneGameState.gameBoard[xCoord][yCoord] == KonaneColor.white {
                    myKonaneGameState.gameBoard[xCoord][yCoord] = KonaneColor.empty
                    printGameBoard()
                    break
                }
            }
        }
    }
    if errorBool == true {
        print("You cannot remove that piece")
        printGameBoard()
    }
}

