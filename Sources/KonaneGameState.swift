class KonaneGameState {
        let width: Int = 16
        let height: Int = 16
        /*
        let spacesAmount: String
        let rowNum: [String]
        let columnNums: String
        */
        init() {
                boardDataStorage = [[KonaneColor]](repeating: [KonaneColor](repeating: KonaneColor.white, count: width), count: height)

                //Sets up the initial board values by looping through for the y and then x values.
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

                //Sets up how the board will be printed.
                /*
                if height < 10 {
                        spacesAmount = "  " //2 spaces
                } else if height < 100 {
                        spacesAmount = "   " //3 spaces
                } else if height < 1000 {
                        spacesAmount = "    " //4 space
                }
                */
        }

        //Stored as [y][x]
        /*private*/ var boardDataStorage: [[KonaneColor]]

/*
        private var isBlackTurn: Bool
        func getIsBlackTurn() -> Bool {}
        func color(atX: Int, atY: Int) -> KonaneColor {} // Bottom left, 0-indexed
        func isValid(move: KonaneMove) -> Bool {}
        func isValid(blackRemove: (x: Int, y: Int)) -> Bool {}
        func isValid(whiteRemove: (x: Int, y: Int)) -> Bool {}
        func perform(move: KonaneMove) {}
        func perform(blackRemove: (x: Int, y: Int)) {}
        func perform(whiteRemove: (x: Int, y: Int)) {}
        func didBlackWin() -> Bool {}
        func didWhiteWin() -> Bool {}
*/
}