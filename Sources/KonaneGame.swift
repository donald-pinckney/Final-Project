class KonaneGame {
	private let gameState: KonaneGameState = KonaneGameState()
	private let blackInputSource: KonaneMoveInputSource
	private let whiteInputSource: KonaneMoveInputSource
	init(blackIsHuman: Bool, whiteIsHuman: Bool) {
		if blackIsHuman {
			blackInputSource = KonaneMoveInputSourceHuman(isBlack: true)
		} else {
			fatalError("No AI Yet!")
		}
		if whiteIsHuman {
			whiteInputSource = KonaneMoveInputSourceHuman(isBlack: false)
		} else {
			fatalError("No AI Yet!")
		}
	}
	func play() -> Bool {
		//black's first turn
		print("Black needs to remove a piece anywhere on the board.")
		displayBoard()
		let blackRemoveLocation = blackInputSource.removeFirstPiece(gameState: gameState)
		gameState.perform(blackRemove: blackRemoveLocation)
		//white's first turn
		print("Now White should remove a piece adjacent to the one removed by Black!")
		displayBoard()
		let whiteRemoveLocation = whiteInputSource.removeSecondPiece(gameState: gameState)
		gameState.perform(whiteRemove: whiteRemoveLocation)
		//now the game will start
		while gameState.didWhiteWin() == false && gameState.didBlackWin() == false {
			let mainGameMove: KonaneMove
			//to be inserted: stuff to collect the move:: WIP, Jishnu
			//stage the move
			if gameState.getIsBlackTurn() {
				print("It's black's turn")
				displayBoard()
				mainGameMove = blackInputSource.nextMove(gameState: gameState)
			} else {
				print("It's white's turn")
				displayBoard()
				mainGameMove = whiteInputSource.nextMove(gameState: gameState)
			}
			//actually do it
			gameState.perform(move: mainGameMove)
		}
		var blackWin: Bool
		if gameState.didBlackWin() {
			blackWin = true
		} else {
			blackWin = false
		}
		return blackWin
	}
	private func displayBoard() {
		/*
		how its gonna get implemented:
		1: make an empty string for each row
		2: append each value for that row, with a space between each one
		3: print each row
		*/
		for i in (0..<gameState.height).reversed() {
			print(rowToString(gameState.getBoard(), i))
		}
		var happy = "    "
		for i in 0..<gameState.width {
			happy.append(String(i))
			if i < 10 {
				happy.append("  ")
			} else {
				happy.append(" ")
			}
		}
		print()
		print(happy)
	}
	private func rowToString(_ b: [[KonaneColor]], _ row: Int) -> String {
		var returnString: String = String(row)
		if row > 9 {
			returnString.append("  ")
		} else {
			returnString.append("   ")
		}
		for i in 0..<gameState.width {
			let type: String
			if gameState.getBoard()[i][row] == KonaneColor.white {
				type = "o"
			} else if gameState.getBoard()[i][row] == KonaneColor.black {
				type = "x"
			} else {
				type = " "
			}
			returnString.append(type)
			returnString.append("  ")
		}
		return returnString
	}
}
