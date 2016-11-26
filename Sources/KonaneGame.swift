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
        
        //
        //Black remove
        //
        displayboard()
        print("Black player (X) must remove the first piece.")
        var br = getInput()
        while !gameState.isValid(blackRemove: (br.xO, br.yO)){
            print("Invalid move. Try again.")
            br = getInput()
        }
        gameState.perform(blackRemove: (br.xO, br.yO))

        //
        //White remove
        //
        displayboard()
        print("Now white must remove a piece.")
        var wr = getInput()
        while !gameState.isValid(whiteRemove: (wr.xO, wr.yO), blackRemove: (br.xO, br.yO)){
            print("Invalid move. Try again.")
            wr = getInput()
        }
        gameState.perform(whiteRemove: (wr.xO, wr.yO))
        displayboard()
        
        //
        //
        print("Normal play has begun.")
        //
        //
        
        while !gameState.didWhiteWin() && !gameState.didBlackWin() {
            while true { //Black's turn
                print("Black player, move a piece.\nFrom:")
                let bfxy = getInput() //bfxy = Black From XY
                print("To:")
                let btxy = getInput() //btxy = Black To XY
                let blackMove = KonaneMove(fromX: bfxy.xO, fromY: bfxy.yO, toX: btxy.xO, toY: btxy.yO)
                if gameState.isValid(move: blackMove) {
                    gameState.perform(move: blackMove)
                    displayboard()
                    break
                }else {
                    print("Invalid move.")
                }
            }
    
            while true { //White's turn
                print("White player, move a piece.\nFrom:")
                let wfxy = getInput() //wfxy = White From XY
                print("To:")
                let wtxy = getInput() //wtxy = White To XY
                let whiteMove = KonaneMove(fromX: wfxy.xO, fromY: wfxy.yO, toX: wtxy.xO, toY: wtxy.yO)
                if gameState.isValid(move: whiteMove) {
                    gameState.perform(move: whiteMove)
                    displayboard()
                    break
                }else {
                    print("Invalid move.")
                }
            }   
        }

        //Wrapping it all up :)
        if gameState.didBlackWin() {
            print("Congratulations, black player! You won!")
        }else {
            print("Congratulations, white player! You won!")
        }
        
        //Huh.   
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
