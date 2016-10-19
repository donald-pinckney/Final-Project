class KonaneGameState {
    let width = 16
    let height = 16

    private var board: [[KonaneColor]] // Each inner array is a column on the board
    private var isBlackTurn = true

    init() {
        let singleCol = [KonaneColor](repeating: KonaneColor.empty, count: height)

        board = [[KonaneColor]](repeating: singleCol, count: width)

        // Checkerboard
        for x in 0..<width {
            for y in 0..<height {
                if (x + y) % 2 == 0 {
                    board[x][y] = KonaneColor.black
                } else {
                    board[x][y] = KonaneColor.white
                }
            }
        }
    }

    func copy() -> KonaneGameState {
        let c = KonaneGameState()
        c.board = board
        c.isBlackTurn = isBlackTurn
        return c
    }

    func getIsBlackTurn() -> Bool {
        return isBlackTurn
    }

    func color(atX: Int, atY: Int) -> KonaneColor {
        return board[atX][atY]
    }

    func isValid(move: KonaneMove) -> Bool {
        print("Doesn't work yet")
        return true
    }

    func isValid(blackRemove: (x: Int, y: Int)) -> Bool  {
        print("Doesn't work yet")
        return true
    }

    func isValid(whiteRemove: (x: Int, y: Int)) -> Bool  {
        print("Doesn't work yet")
        return true
    }

    func perform(move: KonaneMove) {
        print("Doesn't work yet!")
    }

    func perform(blackRemove: (x: Int, y: Int)) {
        var remove = blackRemove
        if !isValid(blackRemove: remove) {
            fatalError("Invalid black remove: \(remove)")
        }
        
        board[remove.x][remove.y] = KonaneColor.empty
    }
    
    func perform(whiteRemove: (x: Int, y: Int)) {
        var remove = whiteRemove
        if !isValid(whiteRemove: remove) {
            fatalError("Invalid white remove: \(remove)")
        }
        
        board[remove.x][remove.y] = KonaneColor.empty
    }

    func didBlackWin() -> Bool  {
        print("Doesn't work yet!")
        return false
    }

    func didWhiteWin() -> Bool  {
        print("Doesn't work yet!")
        return false
    }
}
