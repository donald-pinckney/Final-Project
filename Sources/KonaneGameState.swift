class KonaneGameState {
        width: Int = 16
        height: Int = 16
        init() {
                var boardDataStorage = [[KonaneColor]](repeating: [KonaneColor](repeating: KonaneColor.white, count: width), count: height)

                //Sets up the board values by looping through for the y and then x values.
                for yVal in 0..<height {
                        if yVal % 2 == 0 {
                                for xVal in 0..<width {
                                        if xVal % 2 == 0 {
                                                boardDataStorage[yVal][xVal] = KonaneColor.black
                                        }
                                }
                        } else {
                                for xVal in 0..<width {
                                        if xVal % 2 != 0 {
                                                boardDataStorage[yVal][xVal] = KonaneColor.black
                                        }
                                }
                        }
                }
        }
        private let boardDataStorage: [[KonaneColor]]

        private isBlackTurn: Bool
        getIsBlackTurn() -> Bool
        color(atX: Int, atY: Int) -> KonaneColor // Bottom left, 0-indexed
        isValid(move: KonaneMove) -> Bool
        isValid(blackRemove: (x: Int, y: Int)) -> Bool
        isValid(whiteRemove: (x: Int, y: Int)) -> Bool
        perform(move: KonaneMove)
        perform(blackRemove: (x: Int, y: Int))
        perform(whiteRemove: (x: Int, y: Int))
        didBlackWin() -> Bool
        didWhiteWin() -> Bool
}