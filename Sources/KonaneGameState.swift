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
                    gameBoard[x][y] = KonaneColor.white
                }else{
                    gameBoard[x][y] = KonaneColor.black
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

}
