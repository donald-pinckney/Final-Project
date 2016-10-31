class KonaneGameState {
  let width = 16
  let height = 16
  private var board: [[KonaneColor]]
  private var isBlackTurn = true

  init() { // Sets up board
    var column = [KonaneColor](repeating: KonaneColor.empty, count: height)
    var board = [[KonaneColor]](repeating: column, count: width)
    for x in 0..<width {
      for y in 0..<height {
        if (x + y) % 2 == 0 {
          board[x][y] = KonaneColor.black
        }
        else {
          board[x][y] = KonaneColor.white
        }
      }
    }
  }

  func getIsBlackTurn() -> Bool {
    return isBlackTurn
  }

  func color(atX: Int, atY: Int) -> KonaneColor {
    // Return the color
    return board[atX][atY]
  }

  func isValid(move: KonaneMove) -> Bool {
    // Check if selected piece is valid
    if !(KonaneMove.fromX < width) && !(KonaneMove.fromY < height) {
      return false
      // color matches turn color
    } else if gameState.getIsBlackTurn() {
      if board[KonaneMove.fromX][KonaneMove.fromY] != KonaneColor.black {
        return false
      }
    } else if !gameState.getIsBlackTurn() {
      if board[KonaneMove.fromX][KonaneMove.fromY] != KonaneColor.white {
        return false
      }
    }

    // Check if move is valid
    if !(0 <= KonaneMove.toX < width) && !(0 <= toY < height) {
      return false
    }

    if board[KonaneMove.toX][toY] != empty { //makes sure jump target is possible
      return false
    }

    // Need to add code to check for moves that jump more than once
    // Go over this section with fresh set of eyes
    if (KonaneMove.fromX - KonaneMove.toX % 2) == 0  && KonaneMove.fromY == toY { //check if target is to the left/right
        return true
    }

    if (KonaneMove.fromY - toY % 2) == 0  && KonaneMove.fromX == KonaneMove.toX { //check if target is to the left/right
        return true
    }

    return false
  }

  func isValid(blackRemove: (x: Int, y: Int)) -> Bool {
    return true

  }

  func isValid(whiteRemove: (x: Int, y: Int)) -> Bool {
    return true

  }
  func perform(move: KonaneMove) {
    print("WIP")
    isBlackTurn = !isBlackTurn
  }
  func perform(blackRemove: (x: Int, y: Int)) {
    let coords = blackRemove
    if isValid(blackRemove: coords) {
      board[coords.x][coords.y] = KonaneColor.empty
    } else {
      fatalError("bad remove coords")
    }
  }
  func perform(whiteRemove: (x: Int, y: Int)) {
    let coords = whiteRemove
    if isValid(whiteRemove: coords) {
      board[coords.x][coords.y] = KonaneColor.empty
    }
  }

  func didBlackWin() -> Bool {
    return false
  }
  func didWhiteWin() -> Bool {
    return false
  }
}
