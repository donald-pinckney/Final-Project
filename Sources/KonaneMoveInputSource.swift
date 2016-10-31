class KonaneMoveInputSource {
	var isBlack: Bool
	init(isBlack: Bool) {
		self.isBlack = isBlack
	}
	func removeFirstPiece(gameState: KonaneGameState) -> (x: Int, y: Int) {
		fatalError("Needs to be overrided")
	}
	func removeSecondPiece(gameState: KonaneGameState) -> (x: Int, y: Int) {
		fatalError("Needs to be overrided")
	}
	func nextMove(gameState: KonaneGameState) -> KonaneMoves {
		fatalError("Needs to be overrided")
	}
}
