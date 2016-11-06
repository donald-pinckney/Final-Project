class KonaneGameState {
        //Rules say should be even but doesn't NEED to be. Code says needs to be even right now.
        let width: Int = 16
        let height: Int = 16

        //-1 so that it can't be used until it is changed.
        private var firstX: Int = -1
        private var firstY: Int = -1
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

                //Makes sure board dimensions are even.
                if height % 2 != 0 || width % 2 != 0 {
                    fatalError("Make board dimensions even!")
                }
        }

        //Stored as [y][x]
        /*private*/var boardDataStorage: [[KonaneColor]]

        // private var isBlackTurn: Bool
        // func getIsBlackTurn() -> Bool {}
        // func color(atX: Int, atY: Int) -> KonaneColor {} // Bottom left, 0-indexed
        // func isValid(move: KonaneMove) -> Bool {}

        func isValid(blackRemove: (x: Int, y: Int)) -> Bool { //Checks if black can remove first piece. Checks for the bottom left and top right corners, and for the middle two black spaces.

            if (blackRemove.x == 0 && blackRemove.y == 0) || (blackRemove.x == (width-1) && blackRemove.y == (height-1)) || (blackRemove.x == (width/2-1) && blackRemove.y == (height/2-1)) || (blackRemove.x == (width/2) && blackRemove.y == (height/2)) { //Relies on width and height being even. NOTE: Odd Ints / 2 will round down.
                return true
            } else {
                print("Invalid move! Please choose a different piece.")
                print()
                return false
            }
        }

        func isValid(whiteRemove: (x: Int, y: Int)) -> Bool { //Checks if white can remove second piece. Checks the four pieces around the first piece black removed.

            if ((whiteRemove.x == firstX && (whiteRemove.y == firstY + 1 || whiteRemove.y == firstY - 1)) || (whiteRemove.y == firstY && (whiteRemove.x == firstX + 1 || whiteRemove.x == firstX - 1))) { //Checks for all four cases: above below left right. Needs the space that black removed.
                return true
            } else {
                print("Invalid move! Please choose a different piece.")
                print()
                return false
            }
        }
        // func perform(move: KonaneMove) {}

        func perform(blackRemove: (x: Int, y: Int)) { //Removes black's first piece. Assumes move is valid (should already be checked).

            let x: Int = blackRemove.x
            let y: Int = blackRemove.y
            firstX = x
            firstY = y
            boardDataStorage[y][x] = KonaneColor.empty
        }

        func perform(whiteRemove: (x: Int, y: Int)) { //Removes white's first piece. Assumes move is valid (should already be checked).

            let x: Int = whiteRemove.x
            let y: Int = whiteRemove.y
            boardDataStorage[y][x] = KonaneColor.empty

        }
        // func didBlackWin() -> Bool {}
        // func didWhiteWin() -> Bool {}

}