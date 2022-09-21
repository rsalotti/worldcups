//
//  WinnersTableViewController.swift
//  Cup Champions
//
//  Created by Ricardo Santos on 13/09/22.
//

import UIKit

class WinnersTableViewController: UITableViewController {

    let manager = WorldCupManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = .black
        self.tableView.register(WinnersTableViewCell.self, forCellReuseIdentifier: WinnersTableViewCell.IDENTIFIER)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func goToDetails(of worldCup: WorldCup) {
        let nextVC = WorldCupViewController()
        nextVC.worldCup = worldCup
        navigationController?.pushViewController(nextVC, animated: true)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.numberOfRows()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return WinnersTableViewCell.HEIGHT
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WinnersTableViewCell.IDENTIFIER, for: indexPath) as! WinnersTableViewCell
        let worldCup = manager.getWorldCup(by: indexPath.row)
        cell.setup(with: worldCup)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let worldCup = manager.getWorldCup(by: indexPath.row)
        goToDetails(of: worldCup)
    }
}
