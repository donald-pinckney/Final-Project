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

    0  1  2  3  4  5  6  7  8  9  10 11 12 13 14 15

["15  o  x  o  x  o  x  o  x  o  x  o  x  o  x  o  x", "14  x  o  x  o  x  o  x  o  x  o  x  o  x  o  x  o"

[15,  "o",  "x",  "o",  "x",  "o",  "x",  "o",  "x",  "o",  "x",  "o",  "x",  "o",  "x",  "o",  "x"] [14,  "x",  "o",  "x",  "o",  "x",  "o",  "x",  "o",  "x",  "o",  "x",  "o",  "x",  "o",  "x",  "o"]

["15  o  x  o  x  o  x  o  x  o  x  o  x  o  x  o  x", "14  x  o  x  o  x  o  x  o  x  o  x  o  x  o  x  o", "13  o  x  o  x  o  x  o  x  o  x  o  x  o  x  o  x", "12  x  o  x  o  x  o  x  o  x  o  x  o  x  o  x  o", "11  o  x  o  x  o  x  o  x  o  x  o  x  o  x  o  x", "10  x  o  x  o  x  o  x  o  x  o  x  o  x  o  x  o", "9   o  x  o  x  o  x  o  x  o  x  o  x  o  x  o  x", "8   x  o  x  o  x  o  x  o  x  o  x  o  x  o  x  o", "7   o  x  o  x  o  x  o  x  o  x  o  x  o  x  o  x", "6   x  o  x  o  x  o  x  o  x  o  x  o  x  o  x  o", "5   o  x  o  x  o  x  o  x  o  x  o  x  o  x  o  x", "4   x  o  x  o  x  o  x  o  x  o  x  o  x  o  x  o", "3   o  x  o  x  o  x  o  x  o  x  o  x  o  x  o  x", "2   x  o  x  o  x  o  x  o  x  o  x  o  x  o  x  o", "1   o  x  o  x  o  x  o  x  o  x  o  x  o  x  o  x", "0   x  o  x  o  x  o  x  o  x  o  x  o  x  o  x  o", "", "    0  1  2  3  4  5  6  7  8  9  10 11 12 13 14 15"]

[["2",  "o",  "x",  "o",  "x",  "o",  "x",  "o",  "x",  "o",  "x",  "o",  "x",  "o",  "x",  "o",  "x"], ["1",  "x",  "o",  "x",  "o",  "x",  "o",  "x",  "o",  "x",  "o",  "x",  "o",  "x",  "o",  "x",  "o"]]

[[15,  o,  x,  o,  x,  o,  x,  o,  x,  o,  x,  o,  x,  o,  x,  o,  x], [14,  x,  o,  x,  o,  x,  o,  x,  o,  x,  o,  x,  o,  x,  o,  x,  o]]




*/


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
            }else{
                gameBoard[row].append(colorWhite)
            }
        }else{
            if column % 2 == 0 {
                gameBoard[row].append(colorWhite)
            }else{
                gameBoard[row].append(colorBlack)
            }
        }
    }
}

for ascii in gameBoard {
    print(ascii)
}
