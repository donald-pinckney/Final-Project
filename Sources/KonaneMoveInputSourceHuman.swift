//
//  KonaneMoveInputSourceHuman.swift
//  
//
//  Created by Alex Hill on 10/20/16.
//
//

import Foundation

//Code for first removal of pieces

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
