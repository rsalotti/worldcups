//
//  WinnersTableViewCell.swift
//  Cup Champions
//
//  Created by Ricardo Santos on 16/09/22.
//

import UIKit

class WinnersTableViewCell: UITableViewCell {

    static let IDENTIFIER: String = "WinnersTableViewCell"
    static let HEIGHT: CGFloat = 144
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: kBlack)
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(named: kNavy)!.cgColor
        return view
    }()
    
    lazy var ivTrophy: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.image = UIImage(named: kIconTrophy)
        return img
    }()
    
    lazy var ivIconWinner: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.image = UIImage(named: kIconWinner)
        return img
    }()
    
    lazy var lbYear: UILabel = {
        let lb = UILabel()
        lb.font = UIFont(name: kMontserratLight, size: 14.0)
        lb.textColor = .white
        return lb
    }()
    
    lazy var lbCountry: UILabel = {
        let lb = UILabel()
        lb.font = UIFont(name: kMontserratRegular, size: 14.0)
        lb.textColor = .white
        lb.adjustsFontSizeToFitWidth = true
        return lb
    }()
    
    lazy var ivWinner: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    lazy var lbWinnerName: UILabel = {
        let lb = UILabel()
        lb.font = UIFont(name: kMontserratSemiBold, size: 18.0)
        lb.textColor = UIColor(named: kBlue)
        return lb
    }()
    
    lazy var ivEmphasis: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.image = UIImage(named: kIconSoccer)
        return img
    }()
    
    lazy var lbEmphasisTitle: UILabel = {
        let lb = UILabel()
        lb.font = UIFont(name: kMontserratLight, size: 14.0)
        lb.text = "\(kEmphasis):"
        lb.textColor = UIColor(named: kLightBlue)
        return lb
    }()
    
    lazy var lbEmphasisName: UILabel = {
        let lb = UILabel()
        lb.font = UIFont(name: kMontserratMedium, size: 14.0)
        lb.textColor = UIColor(named: kLightBlue)
        lb.lineBreakMode = .byWordWrapping
        lb.numberOfLines = 2
        return lb
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup(with cup: WorldCup) {
        lbYear.text = String(cup.year)
        lbCountry.text = kDot + " " + cup.country
        
        ivWinner.image = UIImage(named: "\(cup.winner)\(kPNG)")
        
        lbWinnerName.text = cup.winner
        lbEmphasisName.text = cup.emphasis
    }
}

extension WinnersTableViewCell: CodeView {
    func buildViewHierarchy() {
        contentView.sv([
            containerView
        ])
        
        containerView.sv([
            ivTrophy,
            lbYear,
            lbCountry,
            ivWinner,
            lbWinnerName,
            ivIconWinner,
            ivEmphasis,
            lbEmphasisTitle,
            lbEmphasisName
        ])
    }
    
    func setupConstraints() {
        containerView
            .top(equalTo: contentView.topAnchor,constant: 5.0)
            .leading(equalTo: contentView.leadingAnchor, constant: 12.0)
            .trailing(equalTo: contentView.trailingAnchor, constant: -12.0)
            .bottom(equalTo: contentView.bottomAnchor, constant: -5.0)
        
        
        ivTrophy
            .centerY(equalTo: containerView)
            .leading(equalTo: containerView.leadingAnchor, constant: 8.0)
            .size(width: 80.0, height: 80.0)
        
        lbYear
            .top(equalTo: containerView.topAnchor, constant: 16.0)
            .leading(equalTo: ivTrophy.trailingAnchor, constant: 8.0)
            .setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        lbCountry
            .leading(equalTo: lbYear.trailingAnchor, constant: 2.0)
            .centerY(equalTo: lbYear)
            .trailing(equalTo: containerView.trailingAnchor, constant: -12.0)
            .setContentHuggingPriority(.defaultLow, for: .horizontal)
        
        ivWinner
            .top(equalTo: lbCountry.bottomAnchor, constant: 12.0)
            .leading(equalTo: ivTrophy.trailingAnchor, constant: 8.0)
            .size(width: 36, height: 24)
        
        lbWinnerName
            .centerY(equalTo: ivWinner)
            .leading(equalTo: ivWinner.trailingAnchor, constant: 8.0)
            .setContentHuggingPriority(.defaultLow, for: .horizontal)
        
        ivIconWinner
            .centerY(equalTo: ivWinner)
            .trailing(equalTo: containerView, constant: -12.0)
            .size(width: 36.0, height: 24.0)
            .setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        ivEmphasis
            .top(equalTo: lbWinnerName.bottomAnchor, constant: 12.0)
            .leading(equalTo: ivTrophy.trailingAnchor, constant: 8.0)
            .size(width: 24, height: 24)
        
        lbEmphasisTitle
            .centerY(equalTo: ivEmphasis)
            .leading(equalTo: ivEmphasis.trailingAnchor, constant: 8.0)
            .setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        lbEmphasisName
            .centerY(equalTo: ivEmphasis)
            .leading(equalTo: lbEmphasisTitle.trailingAnchor, constant: 8.0)
            .trailing(equalTo: containerView.trailingAnchor, constant: -8.0)
            .setContentHuggingPriority(.defaultLow, for: .horizontal)
    }
    
    func setupAdditionalConfiguration() {
        selectionStyle = .none
        backgroundColor = .black
        ivIconWinner.tintColor = UIColor(named: kGold)
    }
    
}
