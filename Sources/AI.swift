import Foundation
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
    else if gameState.color(atX: gameState.width - 1, atY: gameState.height - 1) == KonaneColor.empty {
      pieceToRemove = (gameState.width - 1, gameState.height - 2)
    }
    else {
      pieceToRemove = (gameState.width / 2, (gameState.height / 2) - 1)
    }
    return pieceToRemove
  }

  //chooses a move to make
  override func nextMove(gameState: konaneGameState) -> KonaneMove {
    var moveList: [KonaneMove] = []
    for xStartToCheck in 0..<gameState.width {
      for yStartToCheck in 0..<gameState.height {
        for xEndToCheck in 0..<gameState.width {
          for yEndToCheck in 0..<gameState.height {
            if gameState.isLegal(move: KonaneMove(fromX: xStartToCheck, fromY: yStartToCheck, toX: xEndToCheck, toY: yEndToCheck)) {
              moveList.append(KonaneMove(fromX: xStartToCheck, fromY: yStartToCheck, toX: xEndToCheck, toY: yEndToCheck))
            }
          }
        }
      }
    }
    var multipleJumpList: [KonaneMove] = []
    var singleJumpList: [KonaneMove] = []
    for moveToCheck in moveList {
      if ((moveToCheck.toX - moveToCheck.fromX) > 2) || ((moveToCheck.fromX - moveToCheck.toX) > 2) || ((moveToCheck.toY - moveToCheck.fromY) > 2) || ((moveToCheck.fromY - moveToCheck.toY) > 2) {
        multipleJumpList.append(moveToCheck)
      }
      else {
        singleJumpList.append(moveToCheck)
      }
    }
    let moveToUse: KonaneMove
    if multipleJumpList.count > 0 {
      let place = random() % multipleJumpList.count
      moveToUse = multipleJumpList[place]
    }
    else {
      let place = random() % singleJumpList.count
      moveToUse = singleJumpList[place]
    }
    return moveToUse
  }

}
