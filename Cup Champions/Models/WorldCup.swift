//
//  WorldCup.swift
//  Cup Champions
//
//  Created by Ricardo Santos on 13/09/22.
//

import Foundation

struct WorldCup: Codable {
    let year: Int
    let country: String
    let winner: String
    let emphasis: String
    let extras: Extra
    let matches: [Match]
}
