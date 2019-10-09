//
//  GameAI.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

func game(board: GameBoard, isWonBy player: GameBoard.Mark) -> Bool {
    
    // Check all columns
    for x in 0..<3 {
        var numMarks = 0
        for y in 0..<3 {
            if board[(x, y)] == player {
                numMarks += 1
            }
        }
        if numMarks == 3 {
            return true
        }
    }
    
    // Check all rows
    for y in 0..<3 {
        var numMarks = 0
        for x in 0..<3 {
            if board[(x, y)] == player {
                numMarks += 1
            }
        }
        if numMarks == 3 {
            return true
        }
    }
    
    // Check for diagonals
    let ltr: [Coordinate] = [(0,0), (1,1), (2,2)]
    var matched = true
    for coord in ltr {
        if board[coord] != player {
            matched = false
        }
    }
    if matched { return true }
    
    let rtl: [Coordinate] = [(2,0), (1,1), (0,2)]
    matched = true
    for coord in rtl {
        if board[coord] != player {
            matched = false
        }
    }
    if matched { return true }
    
    
    return false
}
