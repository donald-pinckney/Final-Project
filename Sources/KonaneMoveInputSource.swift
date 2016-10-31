class KonaneMoveInputSource {
	var isBlack: Bool
	init(isBlack: Bool) {
		self.isBlack = isBlack
	}
	removeFirstPiece(gameState: KonaneGameState) -> (x: Int, y: Int) {
		fatalError("Needs to be overrided")
	}
	removeSecondPiece(gameState: KonaneGameState) -> (x: Int, y: Int) {
		fatalError("Needs to be overrided")
	}
	nextMove(gameState: KonaneGameState) -> KonaneMoves {
		fatalError("Needs to be overrided")
	}
}
