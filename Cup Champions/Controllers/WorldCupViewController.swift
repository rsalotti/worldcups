//
//  WorldCupViewController.swift
//  Cup Champions
//
//  Created by Ricardo Santos on 13/09/22.
//

import UIKit

class WorldCupViewController: UIViewController {
    
    lazy var ivWinner: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.image = UIImage(named: "\(worldCup.winner).png")
        return img
    }()
    
    lazy var lbLineUpTitle: UILabel = {
        let lb = UILabel()
        lb.font = UIFont(name: kMontserratSemiBold, size: 13)
        lb.textColor = .white
        lb.text = "Escalação:"
        return lb
    }()
    
    lazy var lbLineUp: UILabel = {
        let lb = UILabel()
        lb.font = UIFont(name: kMontserratMedium, size: 13)
        lb.numberOfLines = 3
        lb.textColor = UIColor(named: kLightBlue)
        lb.text = worldCup.extras.lineUp
        lb.adjustsFontSizeToFitWidth = true
        return lb
    }()
    
    lazy var lbCoachTitle: UILabel = {
        let lb = UILabel()
        lb.font = UIFont(name: kMontserratSemiBold, size: 13)
        lb.textColor = .white
        lb.text = "Técnico:"
        return lb
    }()
    
    lazy var lbCoach: UILabel = {
        let lb = UILabel()
        lb.font = UIFont(name: kMontserratSemiBold, size: 13)
        lb.textColor = UIColor(named: kLightBlue)
        lb.text = worldCup.extras.coach
        return lb
    }()
    
    lazy var lbTacticalFormationTitle: UILabel = {
        let lb = UILabel()
        lb.font = UIFont(name: kMontserratSemiBold, size: 13)
        lb.textColor = .white
        lb.text = "Esquema Tático:"
        return lb
    }()
    
    lazy var lbTacticalFormation: UILabel = {
        let lb = UILabel()
        lb.font = UIFont(name: kMontserratSemiBold, size: 13)
        lb.textColor = UIColor(named: kLightBlue)
        lb.text = worldCup.extras.tacticalFormation
        return lb
    }()
    
    lazy var lbTrajectoryTitle: UILabel = {
        let lb = UILabel()
        lb.font = UIFont(name: kMontserratBold, size: 13)
        lb.textColor = UIColor(named: kBlue)
        lb.text = "TRAJETÓRIA DO CAMPEÃO"
        return lb
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .black
        table.separatorStyle = .none
        table.register(GameTableViewHeader.self, forHeaderFooterViewReuseIdentifier: GameTableViewHeader.IDENTIFIER)
        table.register(GameTableViewCell.self, forCellReuseIdentifier: GameTableViewCell.IDENTIFIER)
        return table
    }()
    
    var worldCup: WorldCup!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupNavController()
        setupView()
    }
    
    func setupNavController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = UIColor(named: kLightBlue)
        title = "Copa do Mundo \(worldCup.year)"
    }

}

extension WorldCupViewController: CodeView {
    func buildViewHierarchy() {
        view.sv([
            ivWinner,
            lbLineUpTitle,
            lbLineUp,
            lbCoachTitle,
            lbCoach,
            lbTacticalFormationTitle,
            lbTacticalFormation,
            lbTrajectoryTitle,
            tableView
        ])
    }
    
    func setupConstraints() {
        ivWinner
            .top(equalTo: view.topAnchor, constant: 20.0)
            .leading(equalTo: view.leadingAnchor, constant: 20.0)
            .size(width: 88.0, height: 58.0)
        
        lbLineUpTitle
            .top(equalTo: ivWinner.topAnchor)
            .leading(equalTo: ivWinner.trailingAnchor, constant: 8.0)
        
        lbLineUp
            .top(equalTo: lbLineUpTitle.bottomAnchor, constant: 2.0)
            .leading(equalTo: ivWinner.trailingAnchor, constant: 8.0)
            .trailing(equalTo: view.trailingAnchor, constant: -20.0)
        
        lbCoachTitle
            .top(equalTo: lbLineUp.bottomAnchor, constant: 5.0)
            .leading(equalTo: view.leadingAnchor, constant: 20.0)
        
        lbCoach
            .leading(equalTo: lbCoachTitle.trailingAnchor, constant: 8.0)
            .centerY(equalTo: lbCoachTitle)
        
        lbTacticalFormationTitle
            .top(equalTo: lbCoachTitle.bottomAnchor, constant: 5.0)
            .leading(equalTo: view.leadingAnchor, constant: 20.0)
        
        lbTacticalFormation
            .leading(equalTo: lbTacticalFormationTitle.trailingAnchor, constant: 8.0)
            .centerY(equalTo: lbTacticalFormationTitle)
        
        lbTrajectoryTitle
            .top(equalTo: lbTacticalFormation, constant: 40)
            .centerX(equalTo: view)
        
        tableView
            .top(equalTo: lbTrajectoryTitle.bottomAnchor, constant: 15.0)
            .leading(equalTo: view.leadingAnchor)
            .trailing(equalTo: view.trailingAnchor)
            .bottom(equalTo: view.layoutMarginsGuide.bottomAnchor)
        
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = .black
    }
}

extension WorldCupViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return worldCup.matches.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: GameTableViewHeader.IDENTIFIER) as! GameTableViewHeader
        header.setTitle(by: worldCup.matches[section].stage)
        return header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return worldCup.matches[section].games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GameTableViewCell.IDENTIFIER, for: indexPath) as! GameTableViewCell
        cell.prepare(with: worldCup.matches[indexPath.section].games[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return GameTableViewCell.HEIGHT
    }
    
    
}
