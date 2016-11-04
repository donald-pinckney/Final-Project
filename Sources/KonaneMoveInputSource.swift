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

class KonaneMoveInputSourceHuman: KonaneMoveInputSource {
  override func removeFirstPiece(gameState: konaneGameState) -> (x: Int, y: Int) {
    print ("Black, please enter the x coordinate of the piece that you want to remove, than the y coordinate")
    let xLocation = Int(readLine()!)!
    let yLocation = Int(readLine()!)!
    return (xLocation, yLocation)
  }
  override func removeSecondPiece(gameState: konaneGameState) -> (x: Int, y: Int) {
    print ("White, please enter the x coordinate of the piece that you want to remove, than the y coordinate")
    let xLocation = Int(readLine()!)!
    let yLocation = Int(readLine()!)!
    return (xLocation, yLocation)
  }
  override func nextMove(gameState: konaneGameState) -> KonaneMove {
    print("Enter the x coordinate, then the y coordinate of the current location of the piece you want to move")
    let xStart = Int(readLine()!)!
    let yStart = Int(readLine()!)!
    print("Now, enter the x coordinate of the end target of your move, then the y coordinate")
    let xEnd = Int(readLine()!)!
    let yEnd = Int(readLine()!)!
    return KonaneMove(fromX: xStart, fromY: yStart, toX: xEnd, toY: yEnd)
  }
}
