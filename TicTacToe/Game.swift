//
//  Game.swift
//  TicTacToe
//
//  Created by Ciara Beitel on 10/9/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

enum GameState: Equatable {
    case active(GameBoard.Mark) // Active player
    case cat
    case won(GameBoard.Mark) // Winning player
}

struct Game {

    // MARK: - Properties

    private(set) var board: GameBoard = GameBoard()
    
    private(set) var gameState: GameState = .active(.x)
    
    internal var activePlayer: GameBoard.Mark?
    internal var gameIsOver: Bool = false
    internal var winningPlayer: GameBoard.Mark?
    
    // MARK: - Methods

    mutating internal func restart() {
        board = GameBoard()
        gameState = .active(.x)
        gameIsOver = false
        winningPlayer = nil
        activePlayer = .x
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        guard case let GameState.active(activePlayer) = gameState else {
            NSLog("Game is over")
            return
        }
                
        do {
            try board.place(mark: activePlayer, on: coordinate)
            if game(board: board, isWonBy: activePlayer) {
                gameState = .won(activePlayer)
            } else if board.isFull {
                gameState = .cat
            } else {
                let newPlayer = activePlayer == .x ? GameBoard.Mark.o : GameBoard.Mark.x
                gameState = .active(newPlayer)
            }
        } catch {
            NSLog("Illegal move")
        }
    }
}


