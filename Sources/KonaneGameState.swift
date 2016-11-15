import Foundation
class KonaneGameState {
    let width = 16
    let height = 16
   
    private var gameBoard: [[KonaneColor]]

    private var isBlackTurn: Bool = true
   
    init() {
    let singleYLine = [KonaneColor](repeating: KonaneColor.empty, count: height)//this is a column
    gameBoard = [[KonaneColor]](repeating: singleYLine, count: width)
        for x in 0..<gameBoard.count{//this creates the checkerboard pattern :D
            for y in 0..<singleYLine.count{
                if x % 2 == 0 && y % 2 == 0 || x % 2 != 0 && y % 2 != 0 {
                    gameBoard[x][y] = KonaneColor.black
                }else{
                    gameBoard[x][y] = KonaneColor.white
                }
            }
        }
    }
   
    func getIsBlackTurn() -> Bool{ //because isBlackTurn is private lol
        return isBlackTurn   
    }

    func color(atX x: Int, atY y: Int) -> KonaneColor{
        return gameBoard[x][y]
    }
    func checkForPiece(_ direction: moveDirection, _ move: KonaneMove) -> Bool{ //if true is returned, there's a piece lol
        if direction == moveDirection.north {                                   //yes i know theres a better way to do this
            if getIsBlackTurn(){
                return gameBoard[move.fromX][move.fromY + 1] == KonaneColor.white
            }else{
                return gameBoard[move.fromX][move.fromY + 1] == KonaneColor.black
            }
        }else if direction == moveDirection.east {
            if getIsBlackTurn(){
                return gameBoard[move.fromX + 1][move.fromY] == KonaneColor.white
            }else{
                return gameBoard[move.fromX + 1][move.fromY] == KonaneColor.black
            }
        }else if direction == moveDirection.south {
            if getIsBlackTurn(){
                return gameBoard[move.fromX][move.fromY - 1] == KonaneColor.white
            }else{
                return gameBoard[move.fromX][move.fromY - 1] == KonaneColor.black
            }
        }else{ //movedirection west
            if getIsBlackTurn(){
                return gameBoard[move.fromX - 1][move.fromY] == KonaneColor.white
            }else{
                return gameBoard[move.fromX - 1][move.fromY] == KonaneColor.black
            }
        }
    }
    func isValid(move: KonaneMove) -> Bool{ //checking validity of ANY move
        //This function is basically process of elimination for all the not valid parts of a move
        
        //This one checks if where you are going is out of bounds.
        if move.toX < 0 || move.toY < 0 || move.toX > 15 || move.toY > 15 {
            return false
        }
        
        //Lol, can't have some white piece beating up a black one and dragging it off the board. Ha ha.
        if gameBoard[move.toX][move.toY] != KonaneColor.empty{
            return false
        }       
        //Finding the direction of the move, to be used in checkForPiece and the double jumps. Maybe. :)
        var direction = moveDirection.north
        if move.fromX + 2 == move.toX && move.fromY == move.toY{
            direction = moveDirection.east
        }else if move.fromX == move.toX && move.fromY - 2 == move.toY{
            direction = moveDirection.south
        }else if move.fromX - 2 == move.toX && move.fromY == move.toY{
            direction = moveDirection.west
        }//North not included bc that's the default value
        
        //So. First you find a way to check if the number from -> to is % 2.
        if direction == moveDirection.north && (move.toY - move.fromY) % 2 != 0 {
            return false
        }else if direction == moveDirection.east && (move.toX - move.fromX) % 2 != 0 {
            return false
        }else if direction == moveDirection.south && (move.fromY - move.toY) % 2 != 0 {
            return false
        }else if direction == moveDirection.west && (move.fromX - move.toX) % 2 != 0 {
            return false
        }

        //This makes sure there's a piece between fromX/Y and toX/Y.
        if !checkForPiece(direction, move) {
            return false
        }
        
        var count = 0
        if direction == moveDirection.north || direction == moveDirection.south {
            count = Int(sqrt(pow(Double(move.fromY - move.toY), Double(2)))) //This should work, just eliminating any negatives because no! thanks!   
        }else if direction == moveDirection.east || direction == moveDirection.west{
            count = Int(sqrt(pow(Double(move.fromX - move.toX), Double(2)))) //lmao
        }

        //This should check for a piece by breaking move into a bunch of singluar moves and testing each lmao
        for i in 0...count {
            if i % 2 != 0 {
                if direction == moveDirection.north {
                    let tempMove = KonaneMove(fromX: move.fromX, fromY: count - 2, toX: move.toX, toY: count)
                    if !checkForPiece(direction, tempMove){
                        return false
                    }
                }else if direction == moveDirection.east {
                    let tempMove = KonaneMove(fromX: count - 2, fromY: move.fromY, toX: count, toY: move.toY)
                    if !checkForPiece(direction, tempMove){
                        return false
                    }
                }else if direction == moveDirection.south {
                    let tempMove = KonaneMove(fromX: move.fromX, fromY: count + 2, toX: move.toX, toY: count)
                    if !checkForPiece(direction, tempMove){
                        return false
                    }
                }else if direction == moveDirection.west {
                    let tempMove = KonaneMove(fromX: count + 2, fromY: move.fromY, toX: count, toY: move.toY)
                    if !checkForPiece(direction, tempMove){
                        return false
                    }
                }
            }
        }
        //Get the number of spaces moved. Divide by 2. check for piece for each one, increasing x and y MAKE IT WORKKA{WOEGFWUPEFGWPIE
        //Do a loop to checkForPiece(made that one)
        //Find a way to combine the two so you can do both double jumps and single jumps
        

        return true
    }
    func isValid(blackRemove: (x: Int, y: Int)) -> Bool{ //checking validity of white and black remove @ start
        if blackRemove.x == 15 && blackRemove.y == 15 || blackRemove.x == 0 && blackRemove.y == 0{
            return true // outer edges
        }else if blackRemove.x == 7 && blackRemove.y == 7 || blackRemove.x == 8 && blackRemove.y == 8{
            return true  //center squares
        }else{ //you thought you could get away with a bad move? you probably almost did
            return false
        } 
    }
    func isValid(whiteRemove: (x: Int, y: Int), blackRemove: (x: Int, y: Int)) -> Bool{
        if whiteRemove.x < 0 || whiteRemove.x > 15 || whiteRemove.y < 0 || whiteRemove.y > 15{
            return false
        }
        if blackRemove.x + 1 == whiteRemove.x && blackRemove.y == whiteRemove.y{ //piece on right
            return true
        }else if blackRemove.x - 1 == whiteRemove.x && blackRemove.y == whiteRemove.y{ //piece on left
            return true
        }else if blackRemove.x == whiteRemove.x && blackRemove.y + 1 == whiteRemove.y{ //piece on top
            return true
        }else if blackRemove.x == whiteRemove.x && blackRemove.y - 1 == whiteRemove.y{ //piece on bottom
            return true
        }else{
            return false
        }
    }
    func perform(blackRemove: (x: Int, y: Int)){
        gameBoard[blackRemove.x][blackRemove.y] = KonaneColor.empty
    }
    func perform(whiteRemove: (x: Int, y: Int)){
        gameBoard[whiteRemove.x][whiteRemove.y] = KonaneColor.empty
    }
    func perform(move: KonaneMove){
        //isValid will be run before this function is called in main.swift
        
        gameBoard[move.fromX][move.fromY] = KonaneColor.white
        
        //The toX/toY piece being 'moved'
        if getIsBlackTurn() {
            gameBoard[move.toX][move.toY] = KonaneColor.black
        }else{
            gameBoard[move.toX][move.toY] = KonaneColor.white
        }

        //REMOVING PIECE IN MIDDLE!!!! HEY!!
    }
    func didBlackWin() -> Bool {
        for x in 0..<16 {
            for y in 0..<16 {
                if color(atX: x, atY: y) == KonaneColor.empty{
                    if color(atX: x + 2, atY: y) == KonaneColor.black {
                        return false
                    }else if color(atX: x - 2, atY: y) == KonaneColor.black {
                        return false
                    }else if color(atX: x, atY: y + 2) == KonaneColor.black {
                        return false
                    }else if color(atX: x, atY: y - 2) == KonaneColor.black {
                        return false
                    }
                }
            }
        }
        return true 
    }
    func didWhiteWin() -> Bool {
        for x in 0..<16 {
            for y in 0..<16 {
                if color(atX: x, atY: y) == KonaneColor.white{
                    if color(atX: x + 2, atY: y) == KonaneColor.white {
                        return false
                    }else if color(atX: x - 2, atY: y) == KonaneColor.white {
                        return false
                    }else if color(atX: x, atY: y + 2) == KonaneColor.white {
                        return false
                    }else if color(atX: x, atY: y - 2) == KonaneColor.white {
                        return false
                    }
                }
            }
        }
        return true
    }
}

