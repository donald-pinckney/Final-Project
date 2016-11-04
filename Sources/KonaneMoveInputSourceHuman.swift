class KonaneMoveInputSourceHuman: KonaneMoveInputSource {
	override func removeFirstPiece(gameState: KonaneGameState) -> (x: Int, y: Int) {

		let gameState = KonaneGameState()
		var rX: Int = 0
		var rY: Int = 0
		let loop = true
		while loop {

	    	print("Black: What piece do you want to remove?")
	        print("X:")
	        let x = Int(readLine()!)!
	        print("Y:")
	        let y = Int(readLine()!)!
	        print()

	        let isValid = gameState.isValid(blackRemove: (x: x, y: y))

	        //Ensures that the move is valid before exiting the loop.
	        if isValid {
	        	rX = x
	        	rY = y
	        	return (rX, rY)
	        }
	    }
    }
    //Add other overrides.
}