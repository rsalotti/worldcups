//
//  GameTableViewHeader.swift
//  Cup Champions
//
//  Created by Ricardo Santos on 20/09/22.
//

import UIKit

class GameTableViewHeader: UITableViewHeaderFooterView {
    
    static let IDENTIFIER: String = "GameTableViewHeader"
    static let HEIGHT: CGFloat = 45
    
    lazy var lbTitle: UILabel = {
        let lb = UILabel()
        lb.font = UIFont(name: kMontserratSemiBold, size: 13)
        lb.textColor = UIColor(named: kBlue)
        return lb
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setTitle(by title: String) {
        lbTitle.text = title
    }

}

extension GameTableViewHeader: CodeView {
    func buildViewHierarchy() {
        contentView.sv([
            lbTitle
        ])
    }
    
    func setupConstraints() {
        lbTitle
            .centerY(equalTo: contentView)
            .leading(equalTo: contentView.leadingAnchor, constant: 16.0)
    }
    
    func setupAdditionalConfiguration() {
        contentView.backgroundColor = .black
    }
}

