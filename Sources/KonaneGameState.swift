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
        if isBlackTurn == true{ //does this work????
            return true
        }else{
            return false
        }
    }

    func color(atX x: Int, atY y: Int) -> KonaneColor{
        return gameBoard[x][y]
    }
    
    func isValid(move: KonaneMove) -> Bool{ //checking validity of ANY move
        if move.toX < 0 || move.toY < 0 || move.fromX > 15 || move.fromY > 15 {
            return false
        }
        //ok this is checking the piece in btween and the distance? i hope?
        if move.fromX + 2 == move.toX {
            if getIsBlackTurn() && gameBoard[fromX + 1][fromY] == KonaneColor.white {

            }
        }else if move.fromX - 2 == move.toX {
            
        }

        return true//YOU STILL NEED TO CHECK: Piece in between, Distance = 1 or -1 (not jumping 2 or diagonal) andouble jumps!!!!
    }
    func isValid(blackRemove: (x: Int, y: Int)) -> Bool{ //checking validity of white and black remove @ start
        return true //AD SRU
    }
    func isValid(whiteRemove: (x: Int, y: Int)) -> Bool{
        return true //ADD HE
    }
}
