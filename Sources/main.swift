import Foundation
let pid = UInt32(getpid())
srandom(pid)

let game = KonaneGame(blackIsHuman: false, whiteIsHuman: false)
if game.play() {
  print("Black won")
}
else {
  print("White won")
}
