//
//  ScoreFieldViewModel.swift
//  BoardGame
//
//  Created by Szymon Szysz on 10/02/2022.
//

import SwiftUI

final class ScoreFieldViewModel: ObservableObject {
    @Published var scoreFiled: String
    @Published var scorePoint: String
    
    init(scoreFiled: ScoreField) {
        self.scoreFiled = scoreFiled.scoreFiled
        self.scorePoint = scoreFiled.scorePoint
    }
}


struct ScoreFieldView: View {
    
    @ObservedObject var scoreFieldViewModel: ScoreFieldViewModel
    
    init(scoreFieldViewModel: ScoreFieldViewModel)  {
        self.scoreFieldViewModel = scoreFieldViewModel
    }
    
    var body: some View {
        TextField(scoreFieldViewModel.scoreFiled, text: $scoreFieldViewModel.scorePoint)
            .multilineTextAlignment(.center)
            .keyboardType(.numberPad)
    }
}
