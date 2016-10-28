class KonaneGameState {
  let width = 16
  let height = 16
  private var board: [[KonaneColor]]
  private var isBlackTurn = true

  init() { // Sets up board
    var column = [KonaneColor](repeating: KonaneColor.empty, length: height)
    var board = [[KonaneColor]](repeating: column, length: width)
    for x in 0..<width {
      for y in 0..<height {
        if (x + y) % 2 == 0 {
          board[x][y] = black
        }
        else {
          board[x][y] = white
        }
      }
    }
  }

  func getIsBlackTurn() -> Bool {
    return isBlackTurn
  }

  func color(atX: Int, atY: Int) -> KonaneColor // Bottom left, 0-indexed {
    // Return the color
    return board[atX][atY]
  }

  func isValid(move: KonaneMove) -> Bool {
    // Check if selected piece is valid
    if !(0 <= fromX < width) && !(0 <= fromY < height) {
      return false
      // color matches turn color
    } else if gameState.getIsBlackTurn() {
      if board[fromX][fromY] != black {
        return false
      }
    } else if !gameState.getIsBlackTurn() {
      if board[fromX][fromY] != white {
        return false
      }
    }

    // Check if move is valid
    if !(0 <= toX < width) && !(0 <= toY < height) {
      return false
    }

    // Need to add code to check for moves that jump more than once
    // Go over this section with fresh set of eyes
    if !(fromX == toX + 2) || !(fromX == toX - 2) {
      if (fromX == toX) {
        if !(fromY == toY + 2) || !(fromY == toY - 2) {
          return false
        } else {
          return true
        }
      } else {
        return false
      }
    } else {
      return true
    }
  }

  func isValid(blackRemove: (x: Int, y: Int)) -> Bool {


  }

  func isValid(whiteRemove: (x: Int, y: Int)) -> Bool {

  }
  perform(move: KonaneMove)
  perform(blackRemove: (x: Int, y: Int))
  perform(whiteRemove: (x: Int, y: Int))
  didBlackWin() -> Bool
  didWhiteWin() -> Bool
  }
