////
////  NewGameView.swift
////  BoardGame
////
////  Created by Szymon Szysz on 28/01/2022.
////
//
import SwiftUI

struct NewGameView: View {

    @ObservedObject var viewModel: NewGameViewModel
    
    @State private var isPresented = false

    var body: some View {
        VStack {
          
            List {
                Section(header:
                            HStack {
                    Text("Scores")
                    Spacer()
                    Button {
                        viewModel.add()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                ) {
                    ScrollView(.horizontal) {
                        HStack(alignment: .center, spacing: 20) {
                        ForEach($viewModel.games.scores, id: \.id) { $item in
                            PointRowView(gameScoreViewModel: GameScoreViewModel(gameScore: item))
                            Divider()
                        }
                    }
                }
                }
            }
            
            Button {
                isPresented.toggle()
            } label: {
                Text("Revel Winner")
            }
            .fullScreenCover(isPresented: $isPresented) {
                GameWinnerView(winnerList: viewModel.games.users)
            }
        }
        .navigationTitle("New game")
    }
}

class GameScoreViewModel: ObservableObject {
    
    @Published var gameScore: GameScore
    
    init(gameScore: GameScore) {
        self.gameScore = gameScore
    }
    
}


struct PointRowView: View {
    
    @ObservedObject var gameScoreViewModel: GameScoreViewModel
    
    var body: some View {
        VStack {
            Text("\(gameScoreViewModel.gameScore.userName)")
            ForEach($gameScoreViewModel.gameScore.scores) { $score in
                Divider()
                if gameScoreViewModel.gameScore.type == .game {
                   ScoreFieldView(scoreFieldViewModel: ScoreFieldViewModel(scoreFiled: score))
                } else  {
                    ScoreFieldView(scoreFieldViewModel: ScoreFieldViewModel(scoreFiled: score))
                }
            }

        }
    }
}



