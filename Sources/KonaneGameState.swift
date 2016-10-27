class konaneGameState{
  // Creates an array representing a 16*16 board with alternating black and white starting with black
  var gameBoard: [KonaneColor] = []
  init() {
    for x in 0...15 {
      for y in 0...15 {
        if x % 2 == 0 {
          if y % 2 == 0 {
            gameBoard.append(KonaneColor.black)
          }
          else {
            gameBoard.append(KonaneColor.white)
          }
        }
        else {
          if y % 2 == 0 {
            gameBoard.append(KonaneColor.white)
          }
          else {
            gameBoard.append(KonaneColor.black)
          }
        }
      }
    }
  }

  //stores and checks the current turn
  private var isBlackTurn = true
  func getBlackTurn () -> Bool {
    return isBlackTurn
  }

  //changes an x value and a y value into a location in the array representing the game board
  func xyToLocation (xValue: Int, yValue: Int) -> Int {
    let Location = xValue + 16 * yValue
    return Location
  }

  //finds the color of the piece at a given X value and Y value
  func color(atX: Int, atY: Int) -> KonaneColor {
    let location = xyToLocation(xValue: atX, yValue: atY)
    return gameBoard[location]
  }
}
