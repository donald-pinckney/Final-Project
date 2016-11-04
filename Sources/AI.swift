class Peter_KonaneMoveInputSourceAI: KonaneMoveInputSource {
  override func removeFirstPiece(gameState: konaneGameState) -> (x: Int, y: Int) {
    return (0, 0)
  }

  //chooses a second piece to remove (for white)
  override func removeSecondPiece(gameState: konaneGameState) -> (x: Int, y: Int) {
    var pieceToRemove = (1, 1)
    if gameState.color(atX: 0, atY: 0) == KonaneColor.empty {
      pieceToRemove = (0, 1)
    }
    else if gameState.color(atX: 15, atY: 15) == KonaneColor.empty {
      pieceToRemove = (15, 14)
    }
    else {
      pieceToRemove = (7, 8)
    }
    return pieceToRemove
  }

  //chooses a move to make
  override func nextMove(gameState: konaneGameState) -> KonaneMove {
    let move = KonaneMove(fromX: 0, fromY: 0, toX: 0, toY: 0)
    return move
  }
}
