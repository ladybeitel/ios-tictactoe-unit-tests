//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Ciara Beitel on 10/9/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    func testRestartGame() {
        // pre-condition (setup)
        let board = GameBoard()
        var game = Game(board: board, gameState: .cat, activePlayer: .x, gameIsOver: true, winningPlayer: .none)
        
        
        // action (doing the damn thing)
        try! game.makeMark(at: (1, 1))
        game.restart()
        
        // post-condition (assertion)
        XCTAssertEqual(game.gameState, GameState.active(.x))
        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertNil(board[(x, y)])
            }
        }
    }
    
    func testMakingMark() {
        // pre-condition (setup)
        let board = GameBoard()
        var game = Game(board: board, gameState: .active(.x), activePlayer: .x, gameIsOver: false, winningPlayer: .none)
        
        // action (doing the damn thing)
        try! game.makeMark(at: (0, 0))

    
        // post-condition (assertion)
        let markOnSquare = game.board[(0, 0)]
        XCTAssertEqual(markOnSquare, GameBoard.Mark.x)
    }
}
