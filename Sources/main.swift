class KonaneGame {
        let game = KonaneGame(blackIsHuman: true, whiteIsHuman: true)
        var BlackIsHuman: Bool
        var WhiteIsHuman: Bool
        init(blackIsHuman: Bool, whiteIsHuman: Bool) {
        BlackIsHuman = blackIsHuman
        WhiteIsHuman = whiteIsHuman
        if BlackIsHuman == false {
        WhiteIsHuman == true
        } else {
            BlackIsHuman == true
        }
     }
     var gameState: KonaneGameState
     private let blackInputSource: KonaneMoveInputSource
     private let whiteInputSource: KonaneMoveInputSource
}
print("is black human? /(game.play())")
class Konane {
    let width: Int = 16
    let height: Int = 16
    init() {}
    let internalboarddatastorage: Int
    private let isBlackTurn = Bool
    var getIsBlackTurn: Bool
    let color: (_: Int, _: Int)
    //Are the following functions? The ones that I pointed out down in the list????
    func isValid(move: KonaneMove) -> Bool
    func isValid(blackRemove: (x: Int, y: Int)) -> Bool {
    if isValid == false {
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
class KonaneGameState {
    let width: Int = 16
    let height: Int = 16
    init (KonaneGameStateWidth: Int, KonaneGameStateHeight: Int)
    private let InternalBoardDataStorage = []
    /* the InternalBoardDataStorage wasn't working because I think internal by itself is a command so I changed it to be a name all together */
    private var isBlackTurn: Bool
    print("is it blacks turn? /(getIsBlackTurn())")
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
        /*I don't think you need to add what the function returns as ( ex. -> Bool) but  I could be wrong*/                                                                            }
