class KonaneGameState {
    let width: Int = 16
    let height: Int = 16
    // the InternalBoardDataStorage wasn't working because I think internal by itself is a command so I changed it to be a name all together
    private var isBlackTurn: Bool
    init(_ height: Int,_ width: Int) {
        self.width = width
        self.height = height
        InternalBoardDataStorage = [[KonaneColor]](repeating: [KonaneColor](repeating: KonaneColor.empty, count: height), count: width)
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
        self.height = height
        self.width = width
    }
    private var InternalBoardDataStorage: [[KonaneColor]]
    //getIsBlackTurn is a function that I'm calling print(color(atX: Int, atY:Int))*/
    //I think this is how to call a function with either print(function) or just saying the function with parameters but I'm not entirely sure
    //Bottom left, 0-indexed are the following properties functions, cuz I'm not really sure...
    
    func isValid(move: KonaneMove) -> Bool{
        //check all rules to see if the move is valid. Also maybe change Bool to another type
        return true
        }
    func isValid(blackRemove: (x: Int, y: Int)) -> Bool{
        // I think check rules to see if you can remove the piece and check if Bool is the right type to return
        return true
    }
    func isValid(whiteRemove: (x: Int, y: Int)) -> Bool {
        return true
    }
    func perform(move: KonaneMove) -> Int {
        //CHANGE YOUR FUKING RETURN TYPE!!!!!!
        let placeHolder = 5
        // GET RID OF THIS VARIABLE!!!!! ITS WORTHLESS!
        return placeHolder
    }
    func perform(blackRemove: (x: Int, y: Int)) ->  {
    }
    func perform(whiteRemove: (x: Int, y: Int)) {
    }
    func didBlckWin() -> Bool {
    }
    func didWhiteWin() -> Bool {
    }
    
}
