class KonaneMoveInputSource {
  //checks if it is playing for black or white
  let isBlack: Bool
  init(isBlack: Bool) {
    self.isBlack = isBlack
  }

  //chooses a first piece to remove (for black)
  func removeFirstPiece(gameState: konaneGameState) -> (x: Int, y: Int) {
    return (x: 0, y:0)
  }

  //chooses a second piece to remove (for white)
  func removeSecondPiece(gameState: konaneGameState) -> (x: Int, y: Int) {
    return (x:0, y:0)
  }

  //chooses a move to make
  func nextMove(gameState: konaneGameState) -> KonaneMove {
    let move = KonaneMove(fromX: 0, fromY: 0, toX: 0, toY: 0)
    return move
  }
}
