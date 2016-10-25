class KonaneGame {
    private let blackInputSource: KonaneMoveInputSource
    private let whiteInputSource: KonaneMoveInputSource
    private let gameState = KonaneGameState()
    init(blackIsHuman: Bool, whiteIsHuman: Bool){
        if blackIsHuman{
            private let blackInputSource = KonaneMoveInputSourceHuman(isBlack: true)    
        }else{
            print("Yo.")    
        }
        if whiteIsHuman{
            private let whiteInputSource = KonaneMoveInputSourceHuman(isBlack: true)        
        }else{
            print("Yo.")
        }
    }

    func play() -> Bool{
        //do th stuf
    }

    private func displayboard(){
        //it yeah
    }

}
