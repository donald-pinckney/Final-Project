class KonaneMoveInputSource {
    var isBlack: Bool
    init(isBlack: Bool) {
        self.isBlack = isBlack
    }
    
    
    
    func removeFirstPiece(gameState: KonaneGameState) -> (x: Int, y: Int) {
        fatalError("Override this function")
    }
    
    func removeSecondPiece(gameState: KonaneGameState) -> (x: Int, y: Int) {
        fatalError("Override this function")
    }
    
    func nextMove(gameState: KonaneGameState) -> KonaneMove {
        fatalError("Override this function")
    }
}

/*I don't think you need to add what the function returns as ( ex. -> Bool) but  I could be wrong*/
/* I think this is how to call a function with either print(function) or just saying the function with parameters but I'm not entirely sure */

/* Bottom left, 0-indexed are the following properties functions, cuz I'm not really sure... */


