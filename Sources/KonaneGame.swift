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

	}
	private displayBoard() {
		
	}
}
