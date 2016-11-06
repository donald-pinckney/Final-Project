class KonaneMoveInputSourceHuman: KonaneMoveInputSource {

	let gameState = KonaneGameState()
	
	override func removeFirstPiece(gameState: KonaneGameState) -> (x: Int, y: Int) {

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

    override func removeSecondPiece(gameState: KonaneGameState) -> (x: Int, y: Int) {

		var x: Int = 0
		var y: Int = 0
		let loop = true
		while loop {

	    	print("White: What piece do you want to remove?")
	        print("X:")
	        x = Int(readLine()!)!
	        print("Y:")
	        y = Int(readLine()!)!
	        print()

	        let isValid = gameState.isValid(whiteRemove: (x: x, y: y))

	        //Ensures that the move is valid before exiting the loop.
	        if isValid {
	        	return (x, y)
	        }
	    }
    }
    //Add other overrides.
}