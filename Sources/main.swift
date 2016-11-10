import Foundation

let game = KonaneGame(blackIsHuman: true, whiteIsHuman: true)
print("Did black win? \(game.play())")
game.isValid(move: KonaneMove)



