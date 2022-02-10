//
//  NewGameViewModel.swift
//  BoardGame
//
//  Created by Szymon Szysz on 01/02/2022.
//

import Foundation
import Combine
import SwiftUI

final class NewGameViewModel: ObservableObject {
    
    @Published var games: Game = Game(gameID: UUID().uuidString, gameName: "Test", users: [User(userID: "asdas", name: "sada", games: nil)], scores: [GameScore(userid: "Test", userName: "Punkty", type: .game, scores: [ScoreField(scoreFiled: "", scorePoint: "")])])
    
    init(users: [User]) {
        startNewGame(users: users)
    }
    
    func add() {
        
        

        for index in games.scores {
            index.scores.append(ScoreField(scoreFiled: "0Test", scorePoint: "0Test"))
        }
        dump(games.scores)
    }

    
    
    func startNewGame(users: [User]) {
       
        users.forEach {
            games.users.append($0)
            games.scores.append(GameScore(userid: $0.userID, userName: $0.name, type: .player, scores: [ScoreField(scoreFiled: "0", scorePoint: "0")]))
        }
        
        
        
    }
    
    
}











