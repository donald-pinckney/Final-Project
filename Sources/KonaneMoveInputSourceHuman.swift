class KonaneMoveInputSourceHuman: KonaneMoveInputSource {
	override func removeFirstPiece(gameState: KonaneGameState) -> (x: Int, y: Int) {
		while true {
			print("Input x (black):")
			let x = Int(readLine()!)!
			print("Input y (black):")
      let y = Int(readLine()!)!

			if gameState.isValid(blackRemove: (x, y)) {
				return (x, y)
				break
			}
		}
  }
	override func removeSecondPiece(gameState: KonaneGameState) -> (x: Int, y: Int) {
		while true {
			print("Input x (white):")
			let x = Int(readLine()!)!
			print("Input y (white):")
      let y = Int(readLine()!)!

			if gameState.isValid(whiteRemove: (x, y)) {
				return (x, y)
				break
			}
		}
  }
	override func nextMove(gameState: KonaneGameState) -> KonaneMove {
		print("x coordinate of the piece: ")
		let pieceX = Int(readLine()!)!
		print("y coordinate of the piece: ")
		let pieceY = Int(readLine()!)!
		print("x coordinate of the destination: ")
		let destX = Int(readLine()!)!
		print("y coordinate of the destination: ")
		let destY = Int(readLine()!)!

		return KonaneMove(fromX: pieceX, fromY: pieceY, toX: destX, toY: destX)
  }
}
