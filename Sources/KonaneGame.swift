//
//  KonaneGame.swift
//  
//
//  Created by Alex Hill on 10/20/16.
//
//

import Foundation

/*
KonaneGame
x   - init(blackIsHuman: Bool, whiteIsHuman: Bool)
x   - private gameState: KonaneGameState
x   - private blackInputSource: KonaneMoveInputSource
x   - private whiteInputSource: KonaneMoveInputSource
    - play() -> Bool // Returns true if black wins.
    - private displayBoard()
*/





//WILL FIX LATER FIRST GETTING INITIALIZATION DONE
class KonaneGame {

    private var gameState = KonaneGameState.GameState(width: 16, height:16, isBlackTurn: true)
    private let blackInputSource: KonaneMoveInputSource 
    private let whiteInputSource: KonaneMoveInputSource


    init(blackIsHuman: Bool, whiteIsHuman: Bool) {

        if blackIsHuman {
        	blackInputSource = KonaneMoveInputSourceHuman(isBlack: true)
        }
        else {
        	//FIX ONCE AI CODE EXISTS
        	blackInputSource = KonaneMoveInputSourceHuman(isBlack: true)
        }
        if whiteIsHuman {
        	whiteInputSource = KonaneMoveInputSourceHuman(isBlack: false)
        }
        else {
        	//FIX ONCE AI CODE EXISTS
        	whiteInputSource = KonaneMoveInputSourceHuman(isBlack: false)
        }
    }    
}



func play() {
    //ADD CONTENTS AND ACTUALLY WRITE CODE
}



