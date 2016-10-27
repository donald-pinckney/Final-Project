class KonaneGameState {
  let width = 16
  let height = 16
  init()
  private internal board data storage
  private isBlackTurn: Bool
  getIsBlackTurn() -> Bool
  color(atX: Int, atY: Int) -> KonaneColor // Bottom left, 0-indexed
  isValid(move: KonaneMove) -> Bool
  isValid(blackRemove: (x: Int, y: Int)) -> Bool
  isValid(whiteRemove: (x: Int, y: Int)) -> Bool
  perform(move: KonaneMove)
  perform(blackRemove: (x: Int, y: Int))
  perform(whiteRemove: (x: Int, y: Int))
  didBlackWin() -> Bool
  didWhiteWin() -> Bool
  }
