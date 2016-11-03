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
        if move.toX < 0 || move.toY < 0 || move.toX > 15 || move.toY > 15 {
            return false     // CHECKING FOR OUT OF BOUNDS
        }else if move.fromX < 0 || move.fromY < 0 || move.fromX > 15 || move.fromY > 15 {
            return false
        }

        var tempX = move.toX
        var count = 1
        while tempX - 2 != move.fromX {
            tempX -= 2
            count += 1
        } //THESE TWO FUNCTIONS ^ V SHOULD TOGETHER BE A COOL LOOP FOR THE DOUBLE JUMPS
        for _ in 0..<count{
            if move.fromX + 2 != move.toX || move.fromX - 2 != move.toX{
                return false      
            }
        }
        
        //NOW I AM FINDING THE DIRECTIONNNNNN
        var direction = moveDirection.north
        if move.fromX + 2 == move.toX && move.fromY == move.toY{
            direction = moveDirection.east 
        }else if move.fromX == move.toX && move.fromY - 2 == move.toY{
            direction = moveDirection.south
        }else if move.fromX - 2 == move.toX && move.fromY == move.toY{
            direction = moveDirection.west
        }// no north bc it's already set as north
        if !checkForPiece(direction, move) {
            return false
        }


        return true//YOU STILL NEED TO CHECK: Piece in between, +Distance = 1 or -1 (not jumping 2 or diagonal) andouble jumps!!!!
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
