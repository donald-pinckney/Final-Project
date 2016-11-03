import Foundation

let game = KonaneGame(blackIsHuman: true, whiteIsHuman: true)
print("Did black win? \(game.play())")

class KonaneGame {
	init(blackIsHuman: Bool, whiteIsHuman: Bool) {
	    if blackIsHuman == false {
		    // Set input to AI source
            fatalError("No AI yet")
        } else {
		    blackInputSource = KonaneMoveInputSourceHuman(isBlack: true)
        }

        if whiteIsHuman == false {
            fatalError("No AI yet")
        } else {
            whiteInputSource = KonaneMoveInputSourceHuman(isBlack: false)
        }

        
	}
	private var gameState: KonaneGameState = KonaneGameState()
	private let blackInputSource: KonaneMoveInputSource
	private let whiteInputSource: KonaneMoveInputSource

    func play() -> Bool {

    }

    private func displayBoard() {

    }

}


enum KonaneColor {
	case black
	case white
	case empty
}

class KonaneMove {
	init(fromX: Int, fromY: Int, toX: Int, toY: Int) {
        self.fromX = fromX
        self.fromY = fromY
        self.toX = toX
        self.toY = toY
    }

	var fromX: Int
	var fromY: Int 
	var toX: Int 
	var toY: Int
}


class KonaneMoveInputSource {
    init(isBlack: Bool) {
        self.isBlack = isBlack
    }
    var isBlack: Bool



    func removeFirstPiece(gameState: KonaneGameState) -> (x: Int, y: Int) {
        fatalError("Override this function")
    }

    func removeSecondPiece(gameState: KonaneGameState) -> (x: Int, y: Int) {   
        fatalError("Override this function")
    }

    func nextMove(gameState: KonaneGameState) -> KonaneMove {
        fatalError("Override this function")
    }
}
class KonaneGameState {
    let width: Int = 16
    let height: Int = 16
    private let InternalBoardDataStorage: [[KonaneColor]] = [[KonaneColor]](repeating: [KonaneColor](repeating: KonaneColor.empty, count: height), count: width)
    /* the InternalBoardDataStorage wasn't working because I think internal by itself is a command so I changed it to be a name all together */
    private var isBlackTurn: Bool
    init() {
        for x in 0..<width {
            for y in 0..<height {
                if (x + y) % 2 == 0{
                    InternalBoardDataStorage[x][y] = KonaneColor.black
                }
                    else {
                        InternalBoardDataStorage[x][y] = KonaneColor.white
                    }
            }
         }
    }
    /*getIsBlackTurn is a function that I'm calling print(color(atX: Int, atY:Int))*/
    /* I think this is how to call a function with either print(function) or just   saying the function with parameters but I'm not entirely sure */                                                                                   /* Bottom left, 0-indexed are the following properties functions, cuz I'm not    really sure... */
    /*
    isValid(move: KonaneMove) 
    isValid(blackRemove: (x: Int, y: Int))
    isValid(whiteRemove: (x: Int, y: Int))
    perform(move: KonaneMove)
    perform(blackRemove: (x: Int, y: Int))
    perform(whiteRemove: (x: Int, y: Int))
    didBlckWin()
    didWhiteWin()
    */
}
        /*I don't think you need to add what the function returns as ( ex. -> Bool) but  I could be wrong*/                                                                            }
    /* I think this is how to call a function with either print(function) or just saying the function with parameters but I'm not entirely sure */
   
   /* Bottom left, 0-indexed are the following properties functions, cuz I'm not really sure... */
   
