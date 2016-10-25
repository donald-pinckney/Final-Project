class KonaneGameState {
   let width = 16
   let height = 16
   
   private let sinlgeXLine = [KonaneColor](repeating: KonaneColor.empty, count: 16)
   private let gameBoard = [KonaneColor](repeating: singleXLine, count: 16)

   private var isBlackTurn: Bool = true
   
   
   func getIsBlackTurn() -> Bool{ //because isBlackTurn is private lol
       if isBlackTurn == true{ //does this work????
           return true
       }else{
           return false
       }
   }

   //COLOR FUNNNNNNCAY 
}
