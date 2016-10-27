class KonaneGame{
  let blackIsHuman: Bool
  let whiteIsHuman: Bool

  /* The board formating is something like this:
  ...
  32 33 34 35 36 ...
  16 17 18 19 20 ...
  00 01 02 03 04 ...
  */
  private let gameState = konaneGameState()

  func xyToLocation (xValue: Int, yValue: Int) -> Int {
    let Location = xValue + 16 * yValue
    return Location
  }

  let blackCharacter: String
  let whiteCharacter: String

  init(blackIsHuman: Bool, whiteIsHuman: Bool) {
    if whiteIsHuman && blackIsHuman {
      self.whiteIsHuman = whiteIsHuman
      self.blackIsHuman = blackIsHuman
    }
    else {
      print("Sorry, no AIs yet")
      self.blackIsHuman = true
      self.whiteIsHuman = true
    }
    print("Enter the character that you want black to appear as on the display of the board, then the character for white.")
    self.blackCharacter = String(readLine()!)!
    self.whiteCharacter = String(readLine()!)!
  }

  func play() -> Bool {
    print("When I get around to it, this should play a game")
    return false
  }

  private func createBoardLineNumber(lineNumber: Int) -> String {
    var lineString = ""
    if lineNumber <= 9 {
      lineString = "0\(lineNumber) "
    }
    else {
      lineString = "\(lineNumber) "
    }
    for x in 0...15 {
      let pieceAtLocation: KonaneColor = gameState.gameBoard[xyToLocation(xValue: x, yValue: lineNumber)]
      if pieceAtLocation == KonaneColor.white {
        lineString.append(" \(whiteCharacter) ")
      }
      else if pieceAtLocation == KonaneColor.black {
        lineString.append(" \(blackCharacter) ")
      }
      else {
        lineString.append("  ")
      }
    }
    return lineString
  }

  // Make this one private when I am done testing it
  func displayBoard() {
    for x in 0...15 {
      print(createBoardLineNumber(lineNumber: 15 - x))
    }
    print("   00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15")
  }

}
