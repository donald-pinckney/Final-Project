class KonaneGame{
  let blackIsHuman: Bool
  let whiteIsHuman: Bool

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
  let blackPlayer: KonaneMoveInputSource
  let whitePlayer: KonaneMoveInputSource

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
      blackCharacter = String(readLine()!)!
      blackPlayer = KonaneMoveInputSourceHuman(isBlack: true)
    }
    else {
      print("Black will be displayed as 'X'")
      blackCharacter = "X"
      blackPlayer = KonaneMoveInputSource(isBlack: true)
    }
    if whiteIsHuman {
      print("Enter the character that you want white to appear as on the display of the board")
      whiteCharacter = String(readLine()!)!
      whitePlayer = KonaneMoveInputSourceHuman(isBlack: false)
    }
    else {
      print("White will be displayed as 'O'")
      whiteCharacter = "O"
      whitePlayer = KonaneMoveInputSource(isBlack: false)
    }
  }

  func play() -> Bool {
    displayBoard()
    //takes and checks a remove from black
    var blackRemoveToCheck = blackPlayer.removeFirstPiece(gameState: gameState)
    while !gameState.isLegal(blackRemove: blackRemoveToCheck) {
      print("I'm sorry, that is not a legal move")
      blackRemoveToCheck = blackPlayer.removeFirstPiece(gameState: gameState)
    }
    gameState.perform(blackRemove: blackRemoveToCheck)
    displayBoard()
    //takes and checks a remove from white
    var whiteRemoveToCheck = whitePlayer.removeSecondPiece(gameState: gameState)
    while !gameState.isLegal(whiteRemove: whiteRemoveToCheck) {
      print("I'm sorry, that is not a legal move")
      whiteRemoveToCheck = whitePlayer.removeSecondPiece(gameState: gameState)
    }
    gameState.perform(whiteRemove: whiteRemoveToCheck)
    displayBoard()
    var turn = 1
    var blackWon = false
    while turn <= 20 {
      print("It is black's turn")
      var currentBlackMove = blackPlayer.nextMove(gameState: gameState)
      while(!gameState.isLegal(move: currentBlackMove)) {
        print("I'm sorry, but that move is not legal. Please try again.")
        currentBlackMove = blackPlayer.nextMove(gameState: gameState)
      }
      gameState.perform(move: currentBlackMove)
      displayBoard()

      if gameState.didBlackWin() {
        blackWon = true
        break
      }

      gameState.nextTurn()
      print("It is white's turn")
      var currentWhiteMove = whitePlayer.nextMove(gameState: gameState)
      while(!gameState.isLegal(move: currentWhiteMove)) {
        print("I'm sorry, but that move is not legal. Please try again.")
        currentWhiteMove = whitePlayer.nextMove(gameState: gameState)
      }
      gameState.perform(move: currentWhiteMove)
      displayBoard()

      if gameState.didWhiteWin() {
        blackWon = false
        break
      }

      gameState.nextTurn()
      turn += 1
    }
    return blackWon
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
        lineString.append("   ")
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
