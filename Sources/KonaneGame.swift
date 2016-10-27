class KonaneGame {
    private let blackInputSource: KonaneMoveInputSource
    private let whiteInputSource: KonaneMoveInputSource
    private let gameState = KonaneGameState()
    init(blackIsHuman: Bool, whiteIsHuman: Bool){
        if blackIsHuman{
            blackInputSource = KonaneMoveInputSourceHuman(isBlack: true)    
        }else{
            print("Yo.")
            blackInputSource = KonaneMoveInputSourceHuman(isBlack: true)
        }
        if whiteIsHuman{
            whiteInputSource = KonaneMoveInputSourceHuman(isBlack: true)        
        }else{
            print("Yo.")
            whiteInputSource = KonaneMoveInputSourceHuman(isBlack: true)
        }
    }

    func play() -> Bool{
        //do th stuf
        return true
    }

    private func displayboard(){
        //it yeah
    }

}
