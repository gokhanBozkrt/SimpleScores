//
//  Score.swift
//  SimpleScores
//
//  Created by Gökhan Bozkurt on 21.04.2023.
//

import Foundation

struct Score: Codable,Identifiable,Hashable {
    var id = UUID()
    var playerName = "New Player"
    var score = 0
    var color = ColorChoice.blue
    
    static let example = Score()
}
