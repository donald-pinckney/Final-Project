class konaneGameState{
  /* Creates an array representing a 16*16 board with alternating black and white starting with black
  The board formating is something like this:
  ...
  32 33 34 35 36 ...
  16 17 18 19 20 ...
  00 01 02 03 04 ...
  */
  var gameBoard: [KonaneColor] = []
  init() {
    for x in 0...15 {
      for y in 0...15 {
        if x % 2 == 0 {
          if y % 2 == 0 {
            gameBoard.append(KonaneColor.black)
          }
          else {
            gameBoard.append(KonaneColor.white)
          }
        }
        else {
          if y % 2 == 0 {
            gameBoard.append(KonaneColor.white)
          }
          else {
            gameBoard.append(KonaneColor.black)
          }
        }
      }
    }
  }

  //stores and checks the current turn
  private var isBlackTurn = true
  func getBlackTurn () -> Bool {
    return isBlackTurn
  }

  //tells the game that the turn has changed
  func nextTurn() {
    if isBlackTurn {
      isBlackTurn = false
    }
    else {
      isBlackTurn = true
    }
  }

  //changes an x value and a y value into a location in the array representing the game board
  func xyToLocation (xValue: Int, yValue: Int) -> Int {
    let Location = xValue + 16 * yValue
    return Location
  }

  //finds the color of the piece at a given X value and Y value
  func color(atX: Int, atY: Int) -> KonaneColor {
    let location = xyToLocation(xValue: atX, yValue: atY)
    return gameBoard[location]
  }

  //checks if a KonaneMove is legal
  func isLegal(move: KonaneMove) -> Bool {
    var moveIsLegal = true
    if move.fromX < 0 || move.fromY < 0 || move.fromX > 15 || move.fromY > 15 || move.toX < 0 || move.toY < 0 || move.toX > 15 || move.toY > 15 {
      moveIsLegal = false
    }
    if isBlackTurn && (color(atX: move.fromX, atY: move.fromY) != black {
      moveIsLegal = false
    }
    else if !isBlackTurn && (color(atX: move.fromX, atY: move.fromY) != white {
      moveIsLegal = false
    }
    var turnColor: KonaneColor = KonaneColor.empty
    if isBlackTurn {
      turnColor = KonaneColor.black
    }
    else {
      turnColor = KonaneColor.white
    }
    if move.fromY == move.toY && move.fromX != move.toX {
      if move.toX > move.fromX {
        for xToCheck in (move.fromX + 1)...move.toX {
          if (xToCheck - move.fromX) % 2 == 0 {
            if color(atX: xToCheck, atY: move.fromY) != KonaneColor.empty {
              moveIsLegal = false
            }
          }
          else {
            if color(atX: xToCheck, atY: move.fromY) == empty || color(atX: xToCheck, atY: move.fromY) == turnColor {
              moveIsLegal = false
            }
          }
        }
      }
      else {
        for xToCheck in move.toX..<move.fromX {
          if (move.fromX - xToCheck) % 2 == 0 {
            if color(atX: xToCheck, atY: move.fromY) != KonaneColor.empty {
              moveIsLegal = false
            }
          }
          else {
            if color(atX: xToCheck, atY: move.fromY) == empty || color(atX: xToCheck, atY: move.fromY) == turnColor {
              moveIsLegal = false
            }
          }
        }
      }
    }
    else if move.fromX == move.toX && move.fromY != move.toY {
      if move.toY > move.fromY {
        for yToCheck in (move.fromY + 1)...move.toY {
          if (yToCheck - move.fromY) % 2 == 0 {
            if color(atX: move.fromX, atY: yToCheck) != KonaneColor.empty {
              moveIsLegal = false
            }
          }
          else {
            if color(atX: move.fromX, atY: yToCheck) == empty || color(atX: move.fromX, atY: yToCheck) == turnColor {
              moveIsLegal = false
            }
          }
        }
      }
      else {
        for yToCheck in move.toY..<move.fromY {
          if (move.fromY - yToCheck) % 2 == 0 {
            if color(atX: move.fromX, atY: yToCheck) != KonaneColor.empty {
              moveIsLegal = false
            }
          }
          else {
            if color(atX: move.fromX, atY: yToCheck) == empty || color(atX: move.fromX, atY: yToCheck) == turnColor {
              moveIsLegal = false
            }
          }
        }
      }
    }
    else {
      moveIsLegal = false
    }
    return moveIsLegal
  }

  //checks if black can remove a piece at a location at the start of the game
  func isLegal(blackRemove: (x: Int, y: Int)) -> Bool {
    if (blackRemove.x == 0 || blackRemove.x == 7 || blackRemove.x == 8 || blackRemove.x == 15) && blackRemove.x == blackRemove.y {
      return true
    }
    else {
      return false
    }
  }

  // checks if white can remove a piece at a location at the start of the game, after black
  func isLegal(whiteRemove: (x: Int, y: Int)) -> Bool {
    let distances = [-1, 1]
    var legality = false
    for xDif in distances {
      for yDif in distances {
        if (whiteRemove.x + xDif) > -1 && (whiteRemove.x + xDif) < 16 && (whiteRemove.y + yDif) > -1 && (whiteRemove.y + yDif) < 16 {
          if color(atX: whiteRemove.x + xDif, atY: whiteRemove.x + yDif) == KonaneColor.empty {
            legality = true
          }
        }
      }
    }
    return legality
  }

  //makes an inputted konane move
  func perform(move: KonaneMove) {
    print("I still need to code it to make moves. Please try again later")
  }

  //removes a piece for black
  func perform(blackRemove: (x: Int, y: Int)) {
    gameBoard[xyToLocation(xValue: blackRemove.x, yValue: blackRemove.y)] = KonaneColor.empty
  }

  //removes a piece for white
  func perform(whiteRemove: (x: Int, y: Int)) {
    gameBoard[xyToLocation(xValue: whiteRemove.x, yValue: whiteRemove.y)] = KonaneColor.empty
  }

  //checks if black won
  func didBlackWin() -> Bool {
    return false
  }

  //checks if white won
  func didWhiteWin() -> Bool {
    return false
  }
}
