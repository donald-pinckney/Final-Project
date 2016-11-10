import Foundation
class Peter_KonaneMoveInputSourceAI: KonaneMoveInputSource {
  //removes the piece at the upper right of the middle (for black in the first remove)
  override func removeFirstPiece(gameState: konaneGameState) -> (x: Int, y: Int) {
    return (gameState.width / 2 , gameState.height / 2)
  }

  //chooses a second piece to remove (for white)
  override func removeSecondPiece(gameState: konaneGameState) -> (x: Int, y: Int) {
    var pieceToRemove: (Int, Int)
    //if the (0,0) piece is missing, remove the (0,1) piece
    if gameState.color(atX: 0, atY: 0) == KonaneColor.empty {
      pieceToRemove = (0, 1)
    }
    //if the upper right corner piece is missing, remove the one below it
    else if gameState.color(atX: gameState.width - 1, atY: gameState.height - 1) == KonaneColor.empty {
      pieceToRemove = (gameState.width - 1, gameState.height - 2)
    }
    //otherwise, remove the lower right middle piece
    else {
      pieceToRemove = (gameState.width / 2, (gameState.height / 2) - 1)
    }
    return pieceToRemove
  }

  //chooses a move to make
  override func nextMove(gameState: konaneGameState) -> KonaneMove {
    var moveList: [KonaneMove] = []
    //creates a list of all legal moves
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
    var minMoves = 1000
    var minMoveList: [KonaneMove] = []
    for moveToRank in moveList {
      //if a legal move leaves the other player with fewer moves than the current best, it is the new best move
      if gameState.possibleMoveNumber(move: moveToRank) < minMoves {
        minMoves = gameState.possibleMoveNumber(move: moveToRank)
        minMoveList = [moveToRank]
      }
      //if a legal move leaves the other player with just as many moves as the current best, it goes into the list of best moves
      else if gameState.possibleMoveNumber(move: moveToRank) == minMoves {
        minMoveList.append(moveToRank)
      }
    }
    //picks a random member of the list of best moves
    let movePickNumber = random() % minMoveList.count
    return minMoveList[movePickNumber]
  }
}
