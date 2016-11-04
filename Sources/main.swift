class KonaneMove {

}

var gameBoardPieces: [Character] = []
for i in 0..<16 {
	if true {
		gameBoardPieces.append("o")
	} else {
		gameBoardPieces.append("x")
	}
}
print(gameBoardPieces[0])
class KonaneColor() {

}

class KonaneGameState {
	let width: Int = 16
	let height: Int = 16
	init() {
		
	}
	private var isBlackTurn: Bool = true
	func getIsBlackTurn() -> Bool {
		return true
	}
	func color(atX: Int, atY: Int) -> KonaneColor {// Bottom left, 0-indexed
		return 1
	}
	func isValid(move: KonaneMove) -> Bool {
		return true
	}
	func isValid(blackRemove: (x: Int, y: Int)) -> Bool {
		return true
	}
	func isValid(whiteRemove: (x: Int, y: Int)) -> Bool {
		return true
	}
	func perform(move: KonaneMove) {

	}
	func perform(blackRemove: (x: Int, y: Int)) {

	}
	func perform(whiteRemove: (x: Int, y: Int)) {

	}
	func didBlackWin() -> Bool {
		return true
	}
	func didWhiteWin() -> Bool {
		return true
	}
}


class KonaneMoveInputSource {

}

class KonaneGame {
	init(blackIsHuman: Bool, whiteIsHuman: Bool) {
		return 
	}
	private var gameState: KonaneGameState
	private var blackInputSource: KonaneMoveInputSource
	private var whiteInputSource: KonaneMoveInputSource
	func play() -> Bool {
		return didBlackWin
	}
	private func displayBoard() {

	}
}

var didBlackWin: Bool = false
var didWhiteWin: Bool = false

let game = KonaneGame(blackIsHuman: true, whiteIsHuman: true)
print("Did black win? \(game.play())")


