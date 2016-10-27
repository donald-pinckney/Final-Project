class KonaneGame{
  let isBlackHuman: Bool
  let isWhiteHuman: Bool
  print("Enter whether black is a human, then whether white is a human")
  init(isBlackHuman: Bool, isWhiteHuman: Bool) {
    if isWhiteHuman && isBlackHuman {
      self.isWhiteHuman == isWhiteHuman
      self.isBlackHuman == isBlackHuman
    }
    else {
      print("Sorry, no AIs yet")
      self.isBlackHuman == isBlackHuman
      self.isWhiteHuman == isWhiteHuman
    }
  }

  /* The board formating is something like this:
  ...
  32 33 34 35 36 ...
  16 17 18 19 20 ...
  00 01 02 03 04 ...
  */
  private let gameState = konaneGameState()

  func xyToLocation (xValue: Int, yValue: Int) -> Int {
    Location = xValue + 16 * yValue
    return Location
  }

  let blackCharacter: String
  let whiteCharacter: String
  print("Enter the character that you want black to appear as on the display of the board, then the character for white.")
  init(blackCharacter: String, whiteCharacter: String) {
    self.blackCharacter = String(readLine()!)!
    self.whiteCharacter = String(readLine()!)!
  }

  func play() -> bool {
    print("When I get around to it, this should play a game")
  }

  private func createBoardLineNumber(lineNumber: Int) -> String {
    var lineString = "\(lineNumber) "
    for x in 0...15 {
      let pieceAtLocation = gameState.gameBoard[xyToLocation(xValue: x, yValue: lineNumber)]
      if pieceAtLocation == white {
        lineString.append("\(whiteCharacter) ")
      }
      else if pieceAtLocation == black {
        lineString.append("\(blackCharacter) ")
      }
      else {
        lineString.append("  ")
      }
    }
  }

  // Make this one private when I am done testing it
  func displayBoard() {
    for x in 0...15 {
      print(createBoardLineNumber(15 - x))
    }
    print("   01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16")
  }

}
