//
//  PlayersAndGameName.swift
//  BoardGame
//
//  Created by Szymon Szysz on 09/02/2022.
//

import SwiftUI

struct PlayersAndGameName: View {
    
    @State private var gameName: [User] = [User(userID: UUID().uuidString, name: "Player 1", games: nil)]
    
    var body: some View {
        VStack { /// vertical stack of ingredients
            ForEach(gameName.indices, id: \.self) { index in
                TextField("Example Field", text: $gameName[index].name)
                    .textFieldStyle(.roundedBorder)
                    .padding()/// use each element in the array
            }
            
            Button(action: {
                /// Add another empty text field to the view
                gameName.append(User(userID: UUID().uuidString, name: "", games: nil))
            }) {
                Text("Add new player")
            }
            
            NavigationLink(destination: NewGameView(viewModel: NewGameViewModel(users: gameName))) {
                Text("Start game")
            }
        }
    }
}

struct PlayersAndGameName_Previews: PreviewProvider {
    static var previews: some View {
        PlayersAndGameName()
    }
}
