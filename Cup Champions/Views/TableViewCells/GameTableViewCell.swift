//
//  GameTableViewCell.swift
//  Cup Champions
//
//  Created by Ricardo Santos on 20/09/22.
//

import UIKit

class GameTableViewCell: UITableViewCell {
    
    static let IDENTIFIER: String = "GameTableViewCell"
    static let HEIGHT: CGFloat = 65
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: kBlack)
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(named: kNavy)!.cgColor
        return view
    }()
    
    lazy var ivHome: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.image = #imageLiteral(resourceName: "Brasil.png")
        return img
    }()
    
    lazy var ivAway: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.image = #imageLiteral(resourceName: "Arábia Saudita.png")
        return img
    }()
    
    lazy var lbHome: UILabel = {
        let lb = UILabel()
        lb.font = UIFont(name: kMontserratMedium, size: 12)
        lb.textColor = UIColor(named: kLightBlue)
        lb.minimumScaleFactor = 0.2
        lb.textAlignment = .left
        lb.numberOfLines = 0
        lb.lineBreakMode = .byWordWrapping
        lb.text = "Home"
        return lb
    }()
    
    lazy var lbAway: UILabel = {
        let lb = UILabel()
        lb.font = UIFont(name: kMontserratMedium, size: 12)
        lb.textColor = UIColor(named: kLightBlue)
        lb.textAlignment = .right
        lb.minimumScaleFactor = 0.3
        lb.numberOfLines = 0
        lb.lineBreakMode = .byWordWrapping
        lb.text = "Away"
        return lb
    }()
    
    lazy var lbScore: UILabel = {
        let lb = UILabel()
        lb.font = UIFont(name: kMontserratSemiBold, size: 15)
        lb.textColor = .white
        lb.textAlignment = .center
        lb.text = "0 x 0"
        return lb
    }()
    
    lazy var lbStadium: UILabel = {
        let lb = UILabel()
        lb.font = UIFont(name: kMontserratSemiBold, size: 12)
        lb.textColor = .white
        lb.text = "Estádio: Maracanã"
        return lb
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func prepare(with game: Game) {
        ivHome.image = UIImage(named: "\(game.home).png")
        ivAway.image = UIImage(named: "\(game.away).png")
        
        lbHome.text = game.home
        lbAway.text = game.away
        
        lbScore.text = game.score
    }
}

extension GameTableViewCell: CodeView {
    func buildViewHierarchy() {
        contentView.sv([
            containerView
        ])
        
        containerView.sv([
            ivHome,
            ivAway,
            lbHome,
            lbAway,
            lbScore,
            lbScore
        ])
    }
    
    func setupConstraints() {
        containerView
            .top(equalTo: contentView.topAnchor,constant: 5.0)
            .leading(equalTo: contentView.leadingAnchor, constant: 12.0)
            .trailing(equalTo: contentView.trailingAnchor, constant: -12.0)
            .bottom(equalTo: contentView.bottomAnchor, constant: -5.0)
        
        ivHome
            .centerY(equalTo: containerView)
            .leading(equalTo: containerView.leadingAnchor, constant: 16.0)
            .size(width: 46.0, height: 32.0)
        
        ivAway
            .centerY(equalTo: containerView)
            .trailing(equalTo: containerView.trailingAnchor, constant: -16.0)
            .size(width: 46.0, height: 32.0)
        
        lbHome
            .centerY(equalTo: ivHome)
            .leading(equalTo: ivHome.trailingAnchor, constant: 8.0)
            .trailing(equalTo: lbScore.leadingAnchor, constant: -8.0)
            .setContentHuggingPriority(.defaultLow, for: .vertical)
        
        lbAway
            .centerY(equalTo: ivAway)
            .trailing(equalTo: ivAway.leadingAnchor, constant: -8.0)
            .leading(equalTo: lbScore.trailingAnchor, constant: 8.0)
            .setContentHuggingPriority(.defaultLow, for: .vertical)
        
        lbScore
            .centerX(equalTo: containerView)
            .centerY(equalTo: containerView)
            .setContentHuggingPriority(.defaultHigh, for: .vertical)
        
    }
    
    func setupAdditionalConfiguration() {
        selectionStyle = .none
        backgroundColor = .black
    }
    
    
}
