//
//  File.swift
//  
//
//  Created by Alex Hill on 10/26/16.
//
//

import Foundation

//Actually programming a game move
//NOT WORKING YET ERRORS
func searchJumpPiece() {
    
    var searchTable: [[Int]] = []
    
    for column in myKonaneGameState.gameBoard {
        for row in myKonaneGameState.gameBoard[column] {
            if myKonaneGameState.isBlackTurn {
                if myKonaneGameState.gameBoard[column][row] == konaneColor.black {
                    searchTable.append([column, row])
                }
            }
            else if !myKonaneGameState.isBlackTurn {
                if myKonaneGameState.gameBoard[column][row] == konaneColor.white {
                    searchTable.append([column, row])
                }
            }
        }
    }
}




func initializeGame() -> (blackIsHuman: Bool, whiteIsHuman: Bool) {
    var isBlackHuman: Bool = true
    var isWhiteHuman: Bool = true
    var response = ""
    print("Is black human? [Y/N]:")
    
    response = String(readLine()!)!
    if response ==  "Y" {
        print("Black is human")
        isBlackHuman = true
    } else if response ==  "N" {
        print("Black is AI")
        isBlackHuman = false
    } else {
        print("Invalid. Please start over.")
    }
    
    
    print("Is white human? [Y/N]")
    
    response = String(readLine()!)!
    if response ==  "Y" {
        print("White is human")
        isWhiteHuman = true
    } else if response ==  "N" {
        print("White is AI")
        isWhiteHuman = false
    } else {
        print("Invalid. Please start over.")
        
    }
    
    print()
    
    return (isBlackHuman, isWhiteHuman)
    //END User input to initialize KonaneGame
    
    //Initialize KonaneGame with user input
    //WILL FIX ONCE FUNC IS DONE
    //init (blackIsHuman = initializeBlack, whiteIsHuman = initializeWhite)
    
    
}


//BEGIN Populate gameBoard
func populateGameBoard() {
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
}
//END Populate gameBoard

//BEGIN printGameBoard() (MAY BE MISSPLACED)


//BEGIN color()
//Note: column -> X, row -> Y
func color(atX: Int, atY: Int) -> KonaneColor {
    return myKonaneGameState.gameBoard[atX][atY]
    //MAY need to include more code
    //As I am not entirely sure what this function is supposed to do.
}
//END color()


//Function to print available pieces for removal


//function to print the available pieces for removal
func printGameBoardPieceRomovalSearch () {
    print("The available pieces for removal are: \(gameBoardPieceRomovalSearch())")
}



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

