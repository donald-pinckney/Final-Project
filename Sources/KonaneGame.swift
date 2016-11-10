class KonaneGame{
  let blackIsHuman: Bool
  let whiteIsHuman: Bool

  //generates a game board and various related functions
  private let gameState = konaneGameState()

  //finds a location on the board array from an x value and a y value
  func xyToLocation (xValue: Int, yValue: Int) -> Int {
    let Location = xValue + gameState.width * yValue
    return Location
  }

  //lets the player choose what character represents x and what represents y
  let blackCharacter: String
  let whiteCharacter: String
  let blackPlayer: KonaneMoveInputSource
  let whitePlayer: KonaneMoveInputSource

  init(blackIsHuman: Bool, whiteIsHuman: Bool) {
    //sets whether black and white are humans or AIs
    self.whiteIsHuman = whiteIsHuman
    self.blackIsHuman = blackIsHuman
    //sets what characters represent the players when showing the board
    //takes user input if player is a human or automatically sets black to 'X' or y to 'O' if the player is an AI, creates player interfaces
    if blackIsHuman {
      print("Enter the character that you want black to appear as on the display of the board")
      blackCharacter = String(readLine()!)!
      blackPlayer = KonaneMoveInputSourceHuman(isBlack: true)
    }
    else {
      print("Black will be displayed as 'X'")
      blackCharacter = "X"
      blackPlayer = Peter_KonaneMoveInputSourceAI(isBlack: true)
    }
    if whiteIsHuman {
      print("Enter the character that you want white to appear as on the display of the board")
      whiteCharacter = String(readLine()!)!
      whitePlayer = KonaneMoveInputSourceHuman(isBlack: false)
    }
    else {
      print("White will be displayed as 'O'")
      whiteCharacter = "O"
      whitePlayer = Peter_KonaneMoveInputSourceAI(isBlack: false)
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
    //It can't last more than 100 turns
    while turn <= 100 {
      print("It is black's turn")
      //gets the next move for black
      var currentBlackMove = blackPlayer.nextMove(gameState: gameState)
      //gets a new move if the current one isn't legal
      while(!gameState.isLegal(move: currentBlackMove)) {
        print("I'm sorry, but that move is not legal. Please try again.")
        currentBlackMove = blackPlayer.nextMove(gameState: gameState)
      }
      //makes the next move for black
      gameState.perform(move: currentBlackMove)
      displayBoard()
      gameState.nextTurn()
      //checks if black won
      if gameState.didBlackWin() {
        blackWon = true
        break
      }
      print("It is white's turn")
      //gets the next move for white
      var currentWhiteMove = whitePlayer.nextMove(gameState: gameState)
      //gets a new move if the current one isn't legal
      while(!gameState.isLegal(move: currentWhiteMove)) {
        print("I'm sorry, but that move is not legal. Please try again.")
        currentWhiteMove = whitePlayer.nextMove(gameState: gameState)
      }
      //makes the next move for black
      gameState.perform(move: currentWhiteMove)
      displayBoard()
      gameState.nextTurn()
      //checks if white won
      if gameState.didWhiteWin() {
        blackWon = false
        break
      }

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
    for x in 0..<gameState.width {
      let pieceAtLocation: KonaneColor = gameState.gameBoard[xyToLocation(xValue: x, yValue: lineNumber)]
      if pieceAtLocation == KonaneColor.white {
        lineString.append(" \(whiteCharacter) ")
      }
      else if pieceAtLocation == KonaneColor.black {
        lineString.append(" \(blackCharacter) ")
      }
      else {
        lineString.append(" - ")
      }
    }
    return lineString
  }

  private func createBottomLine(numberOfLines: Int) -> String {
    var bottomLine = "  "
    for x in 0..<numberOfLines {
      if x <= 9 {
        bottomLine.append(" 0\(x)")
      }
      else {
        bottomLine.append(" \(x)")
      }
    }
    return bottomLine
  }

  private func displayBoard() {
    print()
    for x in 0..<gameState.height {
      print(createBoardLineNumber(lineNumber: (gameState.height - 1) - x))
      print()
    }
    print(createBottomLine(numberOfLines: gameState.width))
  }

}
