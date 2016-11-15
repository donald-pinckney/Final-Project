class KonaneGame {
    private let blackInputSource: KonaneMoveInputSource
    private let whiteInputSource: KonaneMoveInputSource
    private let gameState = KonaneGameState()
    init(blackIsHuman: Bool, whiteIsHuman: Bool){
        if blackIsHuman{
            blackInputSource = KonaneMoveInputSourceHuman(isBlack: true)    
        }else{
            print("No AI")
            blackInputSource = KonaneMoveInputSourceHuman(isBlack: true)
        }
        if whiteIsHuman{
            whiteInputSource = KonaneMoveInputSourceHuman(isBlack: false)        
        }else{
            print("No AI")
            whiteInputSource = KonaneMoveInputSourceHuman(isBlack: false)
        }
    }

    func getInput() -> (xO: Int, yO: Int) {    
        print("Enter X:", terminator:" ")
        let x = Int(readLine()!)!
        print("Enter y:", terminator:" ")
        let y = Int(readLine()!)!
        return (xO: x, yO: y)

    }

    func play() -> Bool{
        //Start: remove pieces
        print("Konane, created by Livy (by herself)")
        //black-remove
        displayboard()
        print("Black player (X) must remove the first piece.")
        
        var br = getInput()
        while !gameState.isValid(blackRemove: (br.xO, br.yO)){
            print("Invalid move. Try again.")
            br = getInput()
        }
        gameState.perform(blackRemove: (br.xO, br.yO))

        //Time for whiteeeremovi
        displayboard()
        print("Now white must remove a piece.")
        
        var wr = getInput()
        while !gameState.isValid(whiteRemove: (wr.xO, wr.yO), blackRemove: (br.xO, br.yO)){
            print("Invalid move. Try again.")
            wr = getInput()
        }
        gameState.perform(whiteRemove: (wr.xO, wr.yO))
        displayboard()
        
        print("Time for normal play!!")
        while !gameState.didWhiteWin() && !gameState.didBlackWin() {
            var blackNotValid = true
            
            while blackNotValid {
                print("Black player: Enter from-X", terminator:" ")
                let blackMoveFx = Int(readLine()!)!
                print("Now from-y:", terminator:" ")
                let blackMoveFy = Int(readLine()!)!
                print("Enter to-x:", terminator:" ")
                let blackMoveTx = Int(readLine()!)!
                print("Enter to-y:", terminator:" ")
                let blackMoveTy = Int(readLine()!)!
                let blackMove = KonaneMove(fromX: blackMoveFx, fromY: blackMoveFy, toX: blackMoveTx, toY: blackMoveTy)
                blackNotValid = !gameState.isValid(move: blackMove)
                if blackNotValid{
                    print("Sorry, that move doesn't work. *Robot voice* Reinitializing Black-Move loop. Beep Beep Boop!")
                }else{
                    gameState.perform(move: blackMove)
                    displayboard()
                    blackNotValid = false
                }
            }
        }
        
        if gameState.didWhiteWin() {
            print("Congratulations, white player!!! You won!")
        }else{
            print("Congratulations, black player!!! You won!")
        }

        //I think isValid NOTshall be within... perform()
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
                }else if gameState.color(atX: indexX, atY: indexY) == KonaneColor.white{
                    print("[O]", terminator:"")
                }else{
                    print("[ ]", terminator:"")
                }
            }
            print("")
        }
        print("\n      0  1  2  3  4  5  6  7  8  9  10 11 12 13 14 15")
    }

}
