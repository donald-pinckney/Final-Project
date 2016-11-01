class KonaneGame {

    //Important: Need to Create an instance of KonaneGameState!

	private let blackInputSource: KonaneMoveInputSource
	private let whiteInputSource: KonaneMoveInputSource
	private let rowLine: String
	func play() -> Bool {} // Returns true if black wins.
	//Displays the game board.
    private func displayBoard() {

    	//Makes and prints each row of the board
    	for yVal in (0..<KonaneGameState.height).reversed() {
    		private var currentRowSquares: String = "|"
    		for xVal in 0..<KonaneGameState.width {
    			//Turns the enum value into something the computer can print.
    			if KonaneGameState.boardDataStorage[yVal][xVal] == KonaneColor.black {
    				currentRowSquares += " X |"
    			} else if KonaneGameState.boardDataStorage[yVal][xVal] == KonaneColor.white {
    				currentRowSquares += " O |"
    			} else {
    				currentRowSquares += "   |"
    			}
    		}
    		print(rowLine)
    		print(currentRowSquares)
    	}
    	print(rowLine)
   	}

    init(blackIsHuman: Bool, whiteIsHuman: Bool){
		//Stuff goes here.


		//Creates the horizontal line for printing the board.
		private var rowLine: String = "+"
		for xVal in 0..<KonaneGameState.width {
    		rowLine += "---+"
    	}
	}
}