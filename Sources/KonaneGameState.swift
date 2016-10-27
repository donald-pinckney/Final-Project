class KonaneGameState {
  let width = 16
  let height = 16
  init()
  private internal board data storage
  private isBlackTurn: Bool
  func getIsBlackTurn() -> Bool {
    return isBlackTurn
  }

  func color(atX: Int, atY: Int) -> KonaneColor // Bottom left, 0-indexed {

  }

  func isValid(move: KonaneMove) -> Bool {
    var
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
