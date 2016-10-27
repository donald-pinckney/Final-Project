class KonaneGame {
	private gameState: KonaneGameState
	private blackInputSource: KonaneMoveInputSource
	private whiteInputSource: KonaneMoveInputSource
	init(blackIsHuman: Bool, whiteIsHuman: Bool) {
		if blackIsHuman {
			blackInputSource = KonanMoveInputSourceHuman(isBlack: true)
		} else {
			fatalError("No AI Yet!")
		}
		if whiteIsHuman {
			whiteInputSource = KonanMoveInputSourceHuman(isBlack: false)
		} else {
			fatalError("No AI Yet!")
		}
	}
	func play() -> Bool {
		//black's first turn
		print("Black needs to remove a piece anywhere on the board.")
		displayBoard()
		let blackRemoveLocation = blackInputSource.removeFirstPiece(gameState: gameState.copy())
		gameState.perform(move: blackRemoveLocation)
		//white's first turn
		print("Now White should remove a piece adjacent to the one removed by Black!")
		displayBoard()
		let whiteRemoveLocation = whiteInputSource.removeSecondPiece(gameState: gameState.copy())
		gameState.perform(move: whiteRemoveLocation)
		//now the game will start
		while gameState.didWhiteWin() == false && gameState.didBlackWin() == false {
			let mainGameMove: KonaneMove
			//to be inserted: stuff to collect the move:: WIP, Jishnu
			//stage the move
			if gameState.getIsBlackTurn() {
				print("It's black's turn")
				displayBoard()
				mainGameMove = blackInputSource.nextMove(gameState: gameState.copy())
			} else {
				print("It's white's turn")
				displayBoard()
				mainGameMove = whiteInputSource.nextMove(gameState: gameState.copy())
			}
			//actually do it
			gameState.perform(move: mainGameMove)
		}
	}
	private displayBoard() {
		
	}
}
