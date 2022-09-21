//
//  WorldCupManager.swift
//  Cup Champions
//
//  Created by Ricardo Santos on 16/09/22.
//

import UIKit

class WorldCupManager {
    static let shared = WorldCupManager()
    
    var worldCups: [WorldCup] = []
    
    //MARK: - Initializer Manager
    private init() {
        loadWorldCups()
    }
    
    func loadWorldCups() {
        guard let fileURL = Bundle.main.url(forResource: "winners.json", withExtension: nil) else { return }
                            //Pode usar também Bundle.main.url(forResource: "winners", withExtension: "json") 
        
        do {
            let jsonData = try Data(contentsOf: fileURL)
            worldCups = try JSONDecoder().decode([WorldCup].self, from: jsonData)
        } catch let error {
            debugPrint("Error get WorldCups jsonData:", error.localizedDescription)
        }
    }
    
    
    //MARK: - Methods for WinnersTableViewController
    func numberOfRows() -> Int {
        return worldCups.count
    }
    
    func getWorldCup(by row: Int) -> WorldCup {
        return worldCups[row]
    }
    
}
