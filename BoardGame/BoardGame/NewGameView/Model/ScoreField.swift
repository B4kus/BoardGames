//
//  ScoreField.swift
//  BoardGame
//
//  Created by Szymon Szysz on 01/02/2022.
//

import SwiftUI

struct ScoreField {
   let scoreFiled: String
   let scorePoint: String
}

extension ScoreField: Identifiable {
    public typealias ID = String
    public var id: String {
        return UUID().uuidString
    }
}
