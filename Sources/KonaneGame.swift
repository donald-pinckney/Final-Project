class KonaneGame {
	private gameState: KonaneGameState()
	private let blackInputSource: KonaneMoveInputSource
	private let whiteInputSource: KonaneMoveInputSource
	func play() -> Bool {} // Returns true if black wins.
    private func displayBoard() {
    	//Does two things: makes strings to print and prints them.

    	//"---+"Line  1 |+|
    	//" | "/Line 10 +||
    	private var rowSpaces = [String](repeating: "", count: height)
    	private var rowColumnNums: String = "   " //3 spaces.
    	//Makes a horizonal line of the correct length. +---+---+---+
    	private var rowLine: String = "        +" //8 spaces and a plus.
    	for xVal in 0..<width {
    		rowLine += "---+"
    		rowColumnNums += "   \(xVal)"
    	}

    	//Creates a string for each row.
    	for yVal in 0..<height {
    		if yVal < 10 {
    			rowSpaces[yVal] = "\(yVal)   |"
    		} else if yVal < 100 {
    			rowSpaces[yVal] = "\(yVal)  |"
    		} else if yVal < 1000 {
    			rowSpaces[yVal] = "\(yVal) |"
    		} else {
    			rowSpaces[yVal] = "\(yVal) |" //Makes grid unalligned, but nobody plays 1000x1000.
    		}

    		//Adds space value for each column of row. Black = X White = O
    		for xVal in 0..<width {
    			if gameState.boardDataStorage[yVal][xVal] == KonaneColor.black {
    				rowSpaces[yVal] += " X |"
    			} else if gameState.boardDataStorage[yVal][xVal] == KonaneColor.white {
    				rowSpaces[yVal] += " O |"
    			} else {
    				rowSpaces[yVal] += "   |"
    			}
    		}
    	} 

    	//Prints the board.
    	for yVal in (0..<height).reversed() {
    		print(rowLine)
    		print(rowSpaces[yVal])
    		//Continue here.
    	}
    }
    init(blackIsHuman: Bool, whiteIsHuman: Bool) {
		//Stuff goes here. 
	}
}