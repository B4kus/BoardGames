//
//  User.swift
//  BoardGame
//
//  Created by Szymon Szysz on 01/02/2022.
//

import Foundation

struct User {

    let userID: String
    var name: String
    var games: [Game]?
}

extension User: Identifiable {
    
    public typealias ID = String
    public var id: String {
        return UUID().uuidString
    }
}
