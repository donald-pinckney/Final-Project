class KonaneMoveInputSource {

	init(isBlack: Bool) {
		self.isBlack = isBlack
	}
    var isBlack: Bool

    func removeFirstPiece(gameState: KonaneGameState) -> (x: Int, y: Int) {
    	fatalError("Override this function!")
    }

    func removeSecondPiece(gameState: KonaneGameState) -> (x: Int, y: Int) {
    	fatalError("Override this function!")
    }

    func nextMove(gameState: KonaneGameState) -> KonaneMove {
    	fatalError("Override this function!")
    }

}