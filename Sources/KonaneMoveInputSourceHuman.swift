class KonaneMoveInputSourceHuman: KonaneMoveInputSource {
	override func removeFirstPiece(gameState: KonaneGameState) -> (x: Int, y: Int) {

		let gameState = KonaneGameState()
		var x: Int = 0
		var y: Int = 0
		let loop = true
		while loop {

	    	print("Black: What piece do you want to remove?")
	        print("X:")
	        x = Int(readLine()!)!
	        print("Y:")
	        y = Int(readLine()!)!
	        print()

	        let isValid = gameState.isValid(blackRemove: (x: x, y: y))

	        //Ensures that the move is valid before exiting the loop.
	        if isValid {
	        	return (x, y)
	        }
	    }
    }
    //Add other overrides.
}