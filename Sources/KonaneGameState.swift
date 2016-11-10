class KonaneGameState {
  let width = 16
  let height = 16
  private var board: [[KonaneColor]]
  private var isBlackTurn = true

  private var blackRemove: (x: Int, y: Int) = (-1, -1)

  init() { // Sets up board
    let column = [KonaneColor](repeating: KonaneColor.empty, count: height)
    board = [[KonaneColor]](repeating: column, count: width)
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
  func getBoard() -> [[KonaneColor]] {
    return board
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
    if !(move.fromX < width) && !(move.fromY < height) {
      return false
      // color matches turn color
    } else if getIsBlackTurn() {
      if board[move.fromX][move.fromY] != KonaneColor.black {
        return false
      }
    } else if !getIsBlackTurn() {
      if board[move.fromX][move.fromY] != KonaneColor.white {
        return false
      }
    }

    // Check if move is valid
    if !(move.toX < width) && !(move.toY < height) {
      return false
    }

    if board[move.toX][move.toY] != KonaneColor.empty { //makes sure jump target is possible
      return false
    }

    // Need to add code to check for moves that jump more than once
    // Go over this section with fresh set of eyes
    if (move.fromX - move.toX % 2) == 0  && move.fromY == move.toY { //check if target is to the left/right
        return true
    }

    if (move.fromY - move.toY % 2) == 0  && move.fromX == move.toX { //check if target is to the left/right
        return true
    }

    return false
  }

  func isValid(blackRemove: (x: Int, y: Int)) -> Bool {

    if board[blackRemove.x][blackRemove.y] == KonaneColor.black {
        if blackRemove.x == 0 && blackRemove.y == 0 {
          return true
        } else if blackRemove.x == 15 && blackRemove.y == 15 {
          return true
        } else if blackRemove.x == 7 && blackRemove.y == 7 {
          return true
        } else if blackRemove.x == 8 && blackRemove.y == 8 {
          return true
        }
        return false
    }

    return false

  }

  func isValid(whiteRemove: (x: Int, y: Int)) -> Bool {
    if board[whiteRemove.x][whiteRemove.y] == KonaneColor.white {
      if whiteRemove.x == blackRemove.x + 1 || whiteRemove.x == blackRemove.x - 1 {
        return true
      } else if whiteRemove.y == blackRemove.y + 1 || whiteRemove.y == blackRemove.y - 1 {
          return true
      }
    }
    return false
  }

func removeMiddlePieces(KonaneMoveInput move: KonaneMove) {
  if (move.toX - move.fromX) % 2 != 0 {
    let startX = move.fromX
    let destX = move.toX
    for i in startX...destX {
      board[i][move.fromY] = KonaneColor.empty
    }
  }
  if (move.toY - move.fromY) % 2 != 0 {
    let startY = move.fromY
    let destY = move.toY
    for i in startY...destY {
      board[move.fromX][i] = KonaneColor.empty
    }
  }
}

  func perform(move: KonaneMove) {
    board[move.fromX][move.fromY] = KonaneColor.empty
    if isBlackTurn {
      board[move.toX][move.toY] = KonaneColor.black
      removeMiddlePieces(KonaneMoveInput: move)
    }
    if !isBlackTurn {
      board[move.toX][move.toY] = KonaneColor.white
      removeMiddlePieces(KonaneMoveInput: move)
    }
    isBlackTurn = !isBlackTurn
  }


  func perform(blackRemove: (x: Int, y: Int)) {
    let coords = blackRemove
    if isValid(blackRemove: coords) {
      board[coords.x][coords.y] = KonaneColor.empty
      self.blackRemove = blackRemove
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
