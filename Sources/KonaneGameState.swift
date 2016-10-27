class konaneGameState{
  private var gameBoard: [KonaneColor]
  init(gameBoard: [KonaneColor]) {
    gameBoard = []
  }
  for x in 0...255 {
    if x % 2 = 0 {
      gameBoard.append black
    }
    else {
      gameBoard.append white
    }
  }
}
