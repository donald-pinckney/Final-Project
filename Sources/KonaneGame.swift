class KonaneGame {
    private let blackInputSource: KonaneMoveInputSource
    private let whiteInputSource: KonaneMoveInputSource
    private let gameState = KonaneGameState()
    init(blackIsHuman: Bool, whiteIsHuman: Bool){
        if blackIsHuman{
            blackInputSource = KonaneMoveInputSourceHuman(isBlack: true)    
        }else{
            fatalError("No AI")
            blackInputSource = KonaneMoveInputSourceHuman(isBlack: true)
        }
        if whiteIsHuman{
            whiteInputSource = KonaneMoveInputSourceHuman(isBlack: false)        
        }else{
            fatalError("No AI")
            whiteInputSource = KonaneMoveInputSourceHuman(isBlack: false)
        }
    }

    func play() -> Bool{
        //Start: Remove first pieces
        //I think isValid shall be within... perform()
        //and a loop
        //so
        //a loop with perform, displayboard, asking for move and whatnot
        //
        return true
    }

    func displayboard(){
        for indexY in (0..<gameState.width).reversed(){//prints ROWS
            if indexY > 9{
                print("\(indexY)", terminator:"   ")//Terminator is 3 spaces; this prints the index of y
            }else{
                print("\(indexY)", terminator:"    ")//Terminator is 4 spaces because there's one less number
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
        print("\n      0  1  2  3  4  5  6  7  8  9  10 11 12 13 14 15")
    }

}
