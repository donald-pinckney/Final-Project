class KonaneMoveInputSourceHuman: KonaneMoveInputSource {
	override func removeFirstPiece(gameState: KonaneGameState) -> (x: Int, y: Int) {
    	print("Black: What piece do you want to remove?")
        print("X:")
        let x = Int(readLine()!)!
        print("Y:")
        let y = Int(readLine()!)!

        return (x, y)
    }
    //Add other overrides.
}