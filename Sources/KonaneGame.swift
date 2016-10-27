class KonaneGame{
  let blackIsHuman: Bool
  let whiteIsHuman: Bool
  private let blackInputSource: KonaneMoveInputSource
  private let whiteInputSource: KonaneMoveInputSource

  //generates a game board and various related functions
  private let gameState = konaneGameState()

  //finds a location on the board array from an x value and a y value
  func xyToLocation (xValue: Int, yValue: Int) -> Int {
    let Location = xValue + 16 * yValue
    return Location
  }

  //lets the player choose what character represents x and what represents y
  let blackCharacter: String
  let whiteCharacter: String

  init(blackIsHuman: Bool, whiteIsHuman: Bool) {
    //sets whether black and white are humans or AIs
    if whiteIsHuman && blackIsHuman {
      self.whiteIsHuman = whiteIsHuman
      self.blackIsHuman = blackIsHuman
    }
    else {
      print("Sorry, no AIs yet")
      self.blackIsHuman = true
      self.whiteIsHuman = true
    }
    //sets what characters represent the players when showing the board
    //takes user input if player is a human or automatically sets black to 'X' or y to 'O' if the player is an AI
    if blackIsHuman {
      print("Enter the character that you want black to appear as on the display of the board")
      self.blackCharacter = String(readLine()!)!
      self.blackInputSource: KonaneMoveInputSource = KonaneMoveInputSource(isBlack: true)
    }
    else {
      print("Black will be displayed as 'X'")
      blackCharacter = "X"
      self.blackInputSource: KonaneMoveInputSource = KonaneMoveInputSource(isBlack: true)
    }
    if whiteIsHuman {
      print("Enter the character that you want white to appear as on the display of the board")
      self.whiteCharacter = String(readLine()!)!
      self.whiteInputSource: KonaneMoveInputSource = KonaneMoveInputSource(isBlack: false)
    }
    else {
      print("White will be displayed as 'O'")
      whiteCharacter = "O"
      self.whiteInputSource: KonaneMoveInputSource = KonaneMoveInputSource(isBlack: false)
    }
  }

  func play() -> Bool {
    displayBoard()
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
    print()
    for x in 0...15 {
      print(createBoardLineNumber(lineNumber: 15 - x))
      print()
    }
    print("   00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15")
  }

}
