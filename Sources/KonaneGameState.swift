class KonaneGameState {
  let width = 16
  let height = 16
  private var board: [[KonaneColor]]
  
  init() {

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

  private isBlackTurn: Bool
  func getIsBlackTurn() -> Bool {
    return isBlackTurn
  }

  func color(atX: Int, atY: Int) -> KonaneColor // Bottom left, 0-indexed {
    // Return the color
    return board[atX][atY]
  }

  func isValid(move: KonaneMove) -> Bool {
    
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
