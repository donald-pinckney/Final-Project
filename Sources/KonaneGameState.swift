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
    
    func isValid(move: KonaneMove) -> Bool{ //checking validity of ANY move
        //This function is basically process of elimination for all the not valid parts of a move
        
        //This one checks if where you are going is out of bounds.
        //ASK: Why do I need a fromX if that was already validated in the last move? Possibly remove
        if move.toX < 0 || move.toY < 0 || move.toX > 15 || move.toY > 15 {
            return false
        
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
        if direction == moveDirection.north && move.toY - move.fromY % 2 != 0{
            return false
        }else if direction == moveDirection.east && move.toX - move.fromX % 2 != 0 {
            return false
        }else if direction == moveDirection.south && move.fromY - move.toY % 2 != 0 {
            return false
        }else if direction == moveDirection.west && move.fromX - move.toX % 2 != 0 {
            return false
        }
        //Do a loop to checkForPiece(made that one)
        //Find a way to combine the two so you can do both double jumps and single jumps
        
        if !checkForPiece(direction, move) {
            return false
        }

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
}
