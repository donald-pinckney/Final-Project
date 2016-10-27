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

    func displayboard(){
        for indexY in 0..<gameState.width{//prints ROWS
            if gameState.width - indexY > 9{
                print("\(gameState.width - indexY)", terminator:"   ")//Terminator is 3 spaces; this prints the index of y wait what
            }else{
                print("\(gameState.width - indexY)", terminator:"    ")//Terminator is 4 space
            }
            for indexX in 0..<gameState.height{//prints the THINGS in the rows
                if gameState.color(atX: indexX, atY: indexY) == KonaneColor.black{
                    print("[X]", terminator:"")
                }else{
                    print("[ ]", terminator:"")
                }   
            }
            print("")
        }
    }

}
