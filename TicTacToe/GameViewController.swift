//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, BoardViewControllerDelegate {

    // MARK: - Properties
    
    private var game: Game = Game() {
        didSet {
            updateViews()
        }
    }
    
    private var boardViewController: BoardViewController! {
        willSet {
            boardViewController?.delegate = nil
        }
        didSet {
            boardViewController?.board = game.board
            boardViewController?.delegate = self
        }
    }
    
    override func viewDidLoad() {
        updateViews()
    }

    // MARK: - Outlets
    
    @IBOutlet weak var statusLabel: UILabel!
    
    // MARK: - Actions
    
    @IBAction func restartGame(_ sender: Any) {
        game.restart()

    }
    
    // MARK: - Private
    
    private func updateViews() {
        guard isViewLoaded else { return }
        
        switch game.gameState {
        case let .active(player):
            statusLabel.text = "Player \(player.stringValue)'s turn"
        case .cat:
            statusLabel.text = "Cat's game!"
        case let .won(player):
            statusLabel.text = "Player \(player.stringValue) won!"
        }
    }
    
    // MARK: - BoardViewControllerDelegate
    
    func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
        
        try! game.makeMark(at: coordinate)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbedBoard" {
            boardViewController = segue.destination as! BoardViewController
        }
    }
}
