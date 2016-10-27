class KonaneGameState {
   let width = 16
   let height = 16
   
   private let gameBoard: [[KonaneColor]]

   private var isBlackTurn: Bool = true
   
   init() {
      let singleXLine = [KonaneColor](repeating: KonaneColor.empty, count: height)
      gameBoard = [[KonaneColor]](repeating: singleXLine, count: width)
   }
   
   func getIsBlackTurn() -> Bool{ //because isBlackTurn is private lol
       if isBlackTurn == true{ //does this work????
           return true
       }else{
           return false
       }
   }

   //COLOR FUNNNNNNCAY 
}
