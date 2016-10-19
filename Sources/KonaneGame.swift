class KonaneGame {
    private let gameState: KonaneGameState = KonaneGameState()
    private let blackInputSource: KonaneMoveInputSource
    private let whiteInputSource: KonaneMoveInputSource

    init(blackIsHuman: Bool, whiteIsHuman: Bool) {
        if blackIsHuman {
            blackInputSource = KonaneMoveInputSourceHuman(isBlack: true)
        } else {
            fatalError("Doesn't work yet!")
        }

        if whiteIsHuman {
            whiteInputSource = KonaneMoveInputSourceHuman(isBlack: false)
        } else {
            fatalError("Doesn't work yet!")
        }
    }

    func play() -> Bool {
        // Remove Phase
        print("Black starts by removing a middle or corner black piece")
        displayBoard()

        let blackRemovePoint = blackInputSource.removeFirstPiece(gameState: gameState.copy())
        gameState.perform(blackRemove: blackRemovePoint)

        print("Now white removes an adjacent white piece")
        displayBoard()

        let whiteRemovePoint = whiteInputSource.removeSecondPiece(gameState: gameState.copy())
        gameState.perform(whiteRemove: whiteRemovePoint)

        // Now, main game loop
        while gameState.didBlackWin() == false && gameState.didWhiteWin() == false {

            let move: KonaneMove
            if gameState.getIsBlackTurn() {
                print("It is black's turn to jump")
                displayBoard()
                move = blackInputSource.nextMove(gameState: gameState.copy())
            } else {
                print("It is white's turn to jump")
                displayBoard()
                move = whiteInputSource.nextMove(gameState: gameState.copy())
            }
            
            gameState.perform(move: move)
        }

        let blackWins = gameState.didBlackWin()
        if blackWins {
            print("Black wins!")
        } else {
            print("White wins!")
        }
        return blackWins
    }

    private func displayBoard() {
        displayASCIIBoard()
    }

    private func displayASCIIBoard() {
        for y in (0..<gameState.height).reversed() {
            var lineText = "\(y)   "
            if y < 10 {
                lineText.append(" ")
            }
            for x in (0..<gameState.width) {
                let color = gameState.color(atX: x, atY: y)
                let colorText: String
                if color == KonaneColor.black {
                    colorText = "x"
                } else if color == KonaneColor.white {
                    colorText = "o"
                } else {
                    colorText = " "
                }
                lineText.append("\(colorText)   ")
            }
            print(lineText)
        }

        // Bottom row of coordinates
        var bottomRow = "     "
        for x in 0..<gameState.width {
            bottomRow.append("\(x)  ")
            if x < 10 {
                bottomRow.append(" ")
            }
        }
        print()
        print(bottomRow)
    }
}
