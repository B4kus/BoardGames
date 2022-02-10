//
//  MainViewModel.swift
//  BoardGame
//
//  Created by Szymon Szysz on 01/02/2022.
//

import Foundation
import Combine

final class MainViewModel: ObservableObject {
    
    @Published var playedGames: [Game] = []
    
    init() {
        loadGames()
    }
    
    
    private func loadGames() {
        
        /// Download games
        ///
        
        playedGames = [Game(gameID: UUID().uuidString, gameName: "Everdell", users: [User(userID: UUID().uuidString, name: "Ania", games: nil),User(userID: UUID().uuidString, name: "Szymon", games: nil)], scores: [
            GameScore(userid: UUID().uuidString, userName: "Punkty", type: .game, scores: [ScoreField(scoreFiled: "Test1", scorePoint: "2"), ScoreField(scoreFiled: "Test3", scorePoint: "3"), ScoreField(scoreFiled: "Test3", scorePoint: "3")
                                                                           ]
                     ),
            GameScore(userid: UUID().uuidString, userName: "Ania", type: .player, scores: [ScoreField(scoreFiled: "Test1", scorePoint: "2"), ScoreField(scoreFiled: "Test3", scorePoint: "3"), ScoreField(scoreFiled: "Test3", scorePoint:" 3")
                                                                           ]
                     ),
            GameScore(userid: UUID().uuidString, userName: "Szymon", type: .player, scores: [ScoreField(scoreFiled: "Test1", scorePoint: "2"), ScoreField(scoreFiled: "Test3", scorePoint: "3"), ScoreField(scoreFiled: "Test3", scorePoint: "3")
                                                                           ]
                     ),
            GameScore(userid: UUID().uuidString, userName: "Kasia", type: .player, scores: [ScoreField(scoreFiled: "Test1", scorePoint: "2"), ScoreField(scoreFiled: "Test3", scorePoint: "3"), ScoreField(scoreFiled: "Test3", scorePoint: "3")
                                                                           ]
                     ),
            GameScore(userid: UUID().uuidString, userName: "Maciej", type: .player, scores: [ScoreField(scoreFiled: "Test1", scorePoint: "2"), ScoreField(scoreFiled: "Test3", scorePoint: "3"), ScoreField(scoreFiled: "Test3", scorePoint: "3")
                                                                           ]
                     )

        ]),
                       Game(gameID: UUID().uuidString, gameName: "Pociągi", users: [User(userID: UUID().uuidString, name: "Ania", games: nil),User(userID: UUID().uuidString, name: "Szymon", games: nil)], scores: [
                           GameScore(userid: UUID().uuidString, userName: "Punkty", type: .game, scores: [ScoreField(scoreFiled: "Test1", scorePoint: "2"), ScoreField(scoreFiled: "Test3", scorePoint: "3"), ScoreField(scoreFiled: "Test3", scorePoint: "3")
                                                                                          ]
                                    ),
                           GameScore(userid: UUID().uuidString, userName: "Ania", type: .player, scores: [ScoreField(scoreFiled: "Test1", scorePoint: "2"), ScoreField(scoreFiled: "Test3", scorePoint: "3"), ScoreField(scoreFiled: "Test3", scorePoint:" 3")
                                                                                          ]
                                    ),
                           GameScore(userid: UUID().uuidString, userName: "Szymon", type: .player, scores: [ScoreField(scoreFiled: "Test1", scorePoint: "2"), ScoreField(scoreFiled: "Test3", scorePoint: "3"), ScoreField(scoreFiled: "Test3", scorePoint: "3")
                                                                                          ]
                                    ),
                           GameScore(userid: UUID().uuidString, userName: "Kasia", type: .player, scores: [ScoreField(scoreFiled: "Test1", scorePoint: "2"), ScoreField(scoreFiled: "Test3", scorePoint: "3"), ScoreField(scoreFiled: "Test3", scorePoint: "3")
                                                                                          ]
                                    ),
                           GameScore(userid: UUID().uuidString, userName: "Maciej", type: .player, scores: [ScoreField(scoreFiled: "Test1", scorePoint: "2"), ScoreField(scoreFiled: "Test3", scorePoint: "3"), ScoreField(scoreFiled: "Test3", scorePoint: "3")
                                                                                          ]
                                    )

                       ])
                       ]
        
        
    }
    
    
}
