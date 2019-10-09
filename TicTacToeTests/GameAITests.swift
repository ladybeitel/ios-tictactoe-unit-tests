//
//  GameAITests.swift
//  TicTacToeTests
//
//  Created by Ciara Beitel on 10/9/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameAITests: XCTestCase {

    func testWinCheckingVertical() {
        /*
        x o -
        x o -
        x - -
        */
        var board = GameBoard()
        try! board.place(mark: .x, on: (0,0))
        try! board.place(mark: .x, on: (0,1))
        try! board.place(mark: .x, on: (0,2))
        try! board.place(mark: .o, on: (1,0))
        try! board.place(mark: .o, on: (1,1))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingVertical2() {
        /*
        x o -
        x o -
        - o -
        */
        var board = GameBoard()
        try! board.place(mark: .x, on: (0,0))
        try! board.place(mark: .x, on: (0,1))
        try! board.place(mark: .o, on: (1,0))
        try! board.place(mark: .o, on: (1,1))
        try! board.place(mark: .o, on: (1,2))
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    func testWinCheckingVertical3() {
        var board = GameBoard()
        /*
        - x o
        - x o
        - - o
        */
        try! board.place(mark: .x, on: (1, 0))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .o, on: (2, 0))
        try! board.place(mark: .o, on: (2, 1))
        try! board.place(mark: .o, on: (2, 2))
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    func testWinCheckingHorizontal() {
        /*
        x x x
        o o -
        - - -
        */
        var board = GameBoard()
        try! board.place(mark: .x, on: (0,0))
        try! board.place(mark: .x, on: (1,0))
        try! board.place(mark: .x, on: (2,0))
        try! board.place(mark: .o, on: (0,1))
        try! board.place(mark: .o, on: (1,1))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingHorizontal2() {
        /*
        x - x
        o o o
        - - -
        */
        var board = GameBoard()
        try! board.place(mark: .x, on: (0,0))
        try! board.place(mark: .x, on: (2,0))
        try! board.place(mark: .o, on: (0,1))
        try! board.place(mark: .o, on: (1,1))
        try! board.place(mark: .o, on: (2,1))
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    func testWinCheckingHorizontal3() {
        var board = GameBoard()
        /*
        - - o
        o - -
        x x x
        */
        try! board.place(mark: .x, on: (0, 2))
        try! board.place(mark: .x, on: (1, 2))
        try! board.place(mark: .x, on: (2, 2))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .o, on: (2, 0))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingDiagonalLTR() {
        /*
         x - -
         - x -
         o o x
         */
        var board = GameBoard()
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .x, on: (2, 2))
        try! board.place(mark: .o, on: (0, 2))
        try! board.place(mark: .o, on: (1, 2))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingDiagonalRTL() {
        /*
         x - o
         - o -
         o x -
         */
        var board = GameBoard()
        try! board.place(mark: .o, on: (2, 0))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .o, on: (0, 2))
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .x, on: (1, 2))
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    func testCatsGame() {
        /*
         x o x
         x o o
         o x x
         */
        var board = GameBoard()
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (2, 0))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .o, on: (2, 1))
        try! board.place(mark: .o, on: (0, 2))
        try! board.place(mark: .x, on: (1, 2))
        try! board.place(mark: .x, on: (2, 2))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
        
    }
    
    func testIncompleteGame() {
        /*
         x - o
         - o -
         - x -
         */
        var board = GameBoard()
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (2, 0))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (1, 2))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
        
    }
}
