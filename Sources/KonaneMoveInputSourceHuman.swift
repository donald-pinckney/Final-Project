class KonaneMoveInputSourceHuman : KonaneMoveInputSource {
    override func removeFirstPiece(gameState: KonaneGameState) -> (x: Int, y: Int) {
        while true {
            print("Input x coord to remove black piece:")
            let x = Int(readLine()!)!
            print("Input y coord to remove black piece:")
            let y = Int(readLine()!)!
            
            if gameState.isValid(blackRemove: (x, y)) {
                return (x, y)
            }
        }
    }

    override func removeSecondPiece(gameState: KonaneGameState) -> (x: Int, y: Int) {
        while true {
            print("Input x coord to remove white piece:")
            let x = Int(readLine()!)!
            print("Input y coord to remove white piece:")
            let y = Int(readLine()!)!
            
            if gameState.isValid(whiteRemove: (x, y)) {
                return (x, y)
            }
        }
    }

    override func nextMove(gameState: KonaneGameState) -> KonaneMove {
        print("Input x coord to move from:")
        let fx = Int(readLine()!)!
        print("Input y coord to move from:")
        let fy = Int(readLine()!)!

        print("Input x coord to move to:")
        let tx = Int(readLine()!)!
        print("Input y coord to move to:")
        let ty = Int(readLine()!)!


        return KonaneMove(fromX: fx, fromY: fy, toX: tx, toY: ty)
    }
}
