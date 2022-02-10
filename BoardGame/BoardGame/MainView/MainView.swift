//
//  ContentView.swift
//  BoardGame
//
//  Created by Szymon Szysz on 28/01/2022.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel: MainViewModel = MainViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.playedGames, id: \.id) { playedGame in
                Text(playedGame.gameName)
            }
            .navigationTitle("Your Games")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink  {
                        PlayersAndGameName()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}



