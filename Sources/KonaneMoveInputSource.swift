class KonaneMoveInputSource {
    let isBlack: Bool

    init(isBlack: Bool) {
        self.isBlack = isBlack
    }

    func removeFirstPiece(gameState: KonaneGameState) -> (x: Int, y: Int) {
        fatalError("Override me!")
    }

    func removeSecondPiece(gameState: KonaneGameState) -> (x: Int, y: Int) {
        fatalError("Override me!")
    }

    func nextMove(gameState: KonaneGameState) -> KonaneMove {
        fatalError("Override me!")
    }
}
