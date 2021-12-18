//
//  RankingCell.swift
//  HackathonApp
//
//  Created by Abdullah AlRashoudi on 12/16/21.
//

import UIKit

class RankingCell: UITableViewCell {
    
    var nameLabel = UILabel(frame: CGRect(x: 0, y: 30,  width: 250, height: 15 ))
    var scoreLabel = UILabel(frame: CGRect(x: 0, y: 30,  width: 60, height: 15 ))
    let prizeImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        scoreLabel.textAlignment = .right
        contentView.addSubview(scoreLabel)
        nameLabel.textAlignment = .right
        contentView.addSubview(nameLabel)
        configureLabels()
    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureLabels(){
        let marginGuide = contentView.layoutMarginsGuide
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints                                 = false
        nameLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive     = true
        nameLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive             = true
        nameLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive   = true
        nameLabel.numberOfLines = 0
        nameLabel.font = nameLabel.font.withSize(18)
        nameLabel.textColor =   #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        scoreLabel.numberOfLines = 0
        scoreLabel.font = scoreLabel.font.withSize(18)
        scoreLabel.textColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
    }
}

