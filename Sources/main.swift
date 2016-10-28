
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
	    }
        else {
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
class KonaneGameState
    let width: Int = 16
    let height: Int = 16
    var init()
    private  InternalBoardDataStorage
    /* the InternalBoardDataStorage wasn't working because I think internal by itself is a command so I changed it to be a name all together */
    private var isBlackTurn: Bool
    print(getIsBlackTurn)

    /*getIsBlackTurn is a function that I'm calling print(color(atX: Int, atY:    Int)) */
    
    /* I think this is how to call a function with either print(function) or just saying the function with parameters but I'm not entirely sure */
   
   /* Bottom left, 0-indexed are the following properties functions, cuz I'm not really sure... */
   
   isValid(move: KonaneMove)  
   isValid(blackRemove: (x: Int, y: Int))
   isValid(whiteRemove: (x: Int, y: Int))
   perform(move: KonaneMove)
   perform(blackRemove: (x: Int, y: Int))                   
   perform(whiteRemove: (x: Int, y: Int))
   didBlackWin()
   didWhiteWin()
   /*I don't think you need to add what the function returns as ( ex. -> Bool) but I could be wrong*/










>>>>>>> 0cd73873c1727dea7f9981186c76b6059b4e7d49
=======
let game = KonaneGame(blackIsHuman: true, whiteIsHuman: true)
print("Did black win? \(game.play())")

class KonaneGame {

     private var gameState: KonaneGameState
     private let blackInputSource: KonaneMoveInputSource
     private let whiteInputSource: KonaneMoveInputSource



        var BlackIsHuman: Bool
        var WhiteIsHuman: Bool
        init(blackIsHuman: Bool, whiteIsHuman: Bool) {
        BlackIsHuman = blackIsHuman
        WhiteIsHuman = whiteIsHuman
        if BlackIsHuman == false {
        WhiteIsHuman = true
        } else {
            BlackIsHuman = true
        }
     }
}
enum KonaneColor {
    case black
    case white
    case empty
}
class KonaneMove {
    init(fromX: Int, fromY: Int, toX: Int, toY: Int){
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
class KonaneGameState {
    var width: Int = 16
    var height: Int = 16
    private let InternalBoardDataStorage: [[KonaneColor]] = [[KonaneColor]](repeating: [KonaneColor](repeating: KonaneColor.empty, count: height), count: width)
    /* the InternalBoardDataStorage wasn't working because I think internal by itself is a command so I changed it to be a name all together */
    private var isBlackTurn: Bool
    
    init() {
        for x in 0..<width {
            
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
    isValid(move: KonaneMove) 
    isValid(blackRemove: (x: Int, y: Int))
    isValid(whiteRemove: (x: Int, y: Int))
    perform(move: KonaneMove)
    perform(blackRemove: (x: Int, y: Int))
    perform(whiteRemove: (x: Int, y: Int))
    didBlckWin()
    didWhiteWin()
<<<<<<< HEAD
        /*I don't think you need to add what the function returns as ( ex. -> Bool) but  I could be wrong*/                                                                          
=======
        /*I don't think you need to add what the function returns as ( ex. -> Bool) but  I could be wrong*/                                                                            }
>>>>>>> ed38d0e9bb48cbe06d3952a2385cd5c158492d78
>>>>>>> a9c8022ef363a3064d37be64745c0098b06b3c35
