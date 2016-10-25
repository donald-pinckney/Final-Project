<<<<<<< HEAD

=======
class KonaneGame {
	let game = KonaneGame(blackIsHuman: true, whiteIsHuman: true)
		print("Did black win? \(game.play())")
	init() {
		var BlackIsHuman = Bool
		var WhiteIsHuman = Bool
		if BlackIsHuman == false {
			WhiteIsHuman == true
		} else {
			BlackIsHuman == true
		}
	}
	var private.gameState: KonaneGameState
	let private.blackInputSource: KonaneMoveInputSource
	let private.whiteInputSource: KonaneMoveInputSource
}
class Konane {
	width: Int = 16
	height: Int = 16
	init() {}
	private.internalboarddatastorage: 
	private.isBlackTurn: Bool
	var getIsBlackTurn: Bool
	let color: atX: Int, atY: Int) -> KonaneColor
//Are the following functions? The ones that I pointed out down in the list????
	func isValid(move: KonaneMove) -> Bool
	func isValid(blackRemove: (x: Int, y: Int)) -> Bool {
			if IsValid == false {
			print(x, y + "is not valid")
		} else {
			print("The move is valid")
		}
	}


}
enum KonaneColor {
	case black
	case white
	case empty
}
class KonaneMove {
	init(fromX: Int, fromY: Int, toX: Int, toY: Int)
	var fromX = Int
	var fromY
	var toX
	var toY
}
//KonaneGameState
	- width: Int = 16
	- height: Int = 16
	- init()
	- private internal board data storage
	- private isBlackTurn: Bool
	- getIsBlackTurn() -> Bool 
	- color(atX: Int, atY: Int) -> KonaneColor // Bottom left, 0-indexed
	Are the following properties functions, cuz I'm not really sure...
	- isValid(move: KonaneMove) -> Bool
	- isValid(blackRemove: (x: Int, y: Int)) -> Bool
	- isValid(whiteRemove: (x: Int, y: Int)) -> Bool
	- perform(move: KonaneMove)
	- perform(blackRemove: (x: Int, y: Int))
	- perform(whiteRemove: (x: Int, y: Int))
	- didBlackWin() -> Bool
	- didWhiteWin() -> Bool
	
>>>>>>> 0cd73873c1727dea7f9981186c76b6059b4e7d49
