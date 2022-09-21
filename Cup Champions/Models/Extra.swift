//
//  Extra.swift
//  Cup Champions
//
//  Created by Ricardo Santos on 19/09/22.
//

import Foundation

struct Extra: Codable {
    let lineUp: String
    let coach: String
    let tacticalFormation: String
    
    enum CodingKeys: String, CodingKey  {
        case lineUp = "line_up"
        case coach 
        case tacticalFormation = "tactical_formation"
    }
}
