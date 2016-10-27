KonaneMoveInputSource
	- init(isBlack: Bool)
	- isBlack
	- removeFirstPiece(gameState: KonaneGameState) -> (x: Int, y: Int) (should override)
	- removeSecondPiece(gameState: KonaneGameState) -> (x: Int, y: Int) (should override)
	- nextMove(gameState: KonaneGameState) -> KonaneMoves
