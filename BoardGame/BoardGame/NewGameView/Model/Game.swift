//
//  Game.swift
//  BoardGame
//
//  Created by Szymon Szysz on 01/02/2022.
//

import SwiftUI

class Game {
    let gameID: String
    var gameName: String
    var users: [User]
    var scores: [GameScore]
    
    init(gameID: String, gameName: String, users: [User], scores: [GameScore]) {
        self.gameID = gameID
        self.gameName = gameName
        self.users = users
        self.scores = scores
    }
}

extension Game: Identifiable {
    public typealias ID = String
    public var id: String {
        return UUID().uuidString
    }
}
