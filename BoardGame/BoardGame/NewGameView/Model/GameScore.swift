//
//  GameScore.swift
//  BoardGame
//
//  Created by Szymon Szysz on 01/02/2022.
//

import SwiftUI

enum ScoreType {
    case player
    case game
}

class GameScore {
    
    let userid: String
    var userName: String
    let type: ScoreType
    var scores: [ScoreField]
    
    
    init(userid: String, userName: String, type: ScoreType, scores: [ScoreField]) {
        self.userid = userid
        self.userName = userName
        self.type = type
        self.scores = scores
    }
}

extension GameScore: Identifiable {
    
    public typealias ID = String
    public var id: String {
        return UUID().uuidString
    }
}
