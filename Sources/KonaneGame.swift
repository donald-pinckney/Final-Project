class KonaneGame {
    init(blackIsHuman: Bool, whiteIsHuman: Bool) {
        if blackIsHuman == false {
            // Set input to AI source
            fatalError("No AI yet")
        } else {
            blackInputSource = KonaneMoveInputSourceHuman(isBlack: true)
        }
        
        if whiteIsHuman == false {
            fatalError("No AI yet")
        } else {
            whiteInputSource = KonaneMoveInputSourceHuman(isBlack: false)
        }
        
        
    }
    private var gameState = KonaneGameState(height: 16, width: 16, isBlackTurn: true)
    private let blackInputSource: KonaneMoveInputSource
    private let whiteInputSource: KonaneMoveInputSource

    func play() -> Bool {
        // a bool saying `if its time to play or not    
    }
    
    private func displayBoard() {
        // an array of columns inside an array of rows, I think. Or vice-versa 
    }
    
}
