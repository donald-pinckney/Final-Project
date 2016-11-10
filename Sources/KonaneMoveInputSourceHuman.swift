class KonaneMoveInputSourceHuman: KonaneMoveInputSource {

	//let gameState = KonaneGameState() Might be unneccesary.
	
	override func removeFirstPiece(gameState: KonaneGameState) -> (x: Int, y: Int) {

		let loop = true
		while loop {

	    	print("Black: What piece do you want to remove?")
	        print("X:")
	        var x = Int(readLine()!)!
	        print("Y:")
	        var y = Int(readLine()!)!
	        print()

	        let isValid = gameState.isValid(blackRemove: (x: x, y: y))

	        //Ensures that the move is valid before exiting the loop.
	        if isValid {
	        	return (x, y)
	        }
	    }
    }

    override func removeSecondPiece(gameState: KonaneGameState) -> (x: Int, y: Int) {

		let loop = true
		while loop {

	    	print("White: What piece do you want to remove?")
	        print("X:")
	        var x = Int(readLine()!)!
	        print("Y:")
	        var y = Int(readLine()!)!
	        print()

	        let isValid = gameState.isValid(whiteRemove: (x: x, y: y))

	        //Ensures that the move is valid before exiting the loop.
	        if isValid {
	        	return (x, y)
	        }
	    }
    }
    
    override func nextMove(gameState: KonaneGameState) -> KonaneMove { //Asks for move, checks, puts values in KonaneMove, returns said KonaneMove.

    	let isBlackTurn = gameState.getIsBlackTurn()
    	let loop = true
		while loop {

			if isBlackTurn {
	    		print("Black: What piece do you want to move?")
	    	} else {
	    		print("White: What piece do you want to move?")
	    	}
	        print("X:")
	        var fromX = Int(readLine()!)!
	        print("Y:")
	        var fromY = Int(readLine()!)!
	        print()

	        if isBlackTurn {
	    		print("Black: Where do you want to move to?")
	    	} else {
	    		print("White: Where do you want to move to?")
	    	}
	        print("X:")
	        var toX = Int(readLine()!)!
	        print("Y:")
	        var toY = Int(readLine()!)!
	        print()

	        let possibleMove = KonaneMove(fromX: fromX, fromY: fromY, toX: toX, toY: toY)

	        let isValid = gameState.isValid(move: possibleMove)

	        //Ensures that the move is valid before exiting the loop.
	        if isValid {
	        	return possibleMove
	        }
	    }
	}
}