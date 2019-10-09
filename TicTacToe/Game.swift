//
//  Game.swift
//  TicTacToe
//
//  Created by Ciara Beitel on 10/9/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    // MARK: - Properties

    private(set) var board: GameBoard

    internal var activePlayer: GameBoard.Mark?
    internal var gameIsOver: Bool
    internal var winningPlayer: GameBoard.Mark?
    
    // MARK: - Methods

    mutating internal func restart()
    mutating internal func makeMark(at coordinate: Coordinate) throws
}
