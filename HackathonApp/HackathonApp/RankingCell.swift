//
//  RankingCell.swift
//  HackathonApp
//
//  Created by Abdullah AlRashoudi on 12/16/21.
//

import UIKit

class RankingCell: UITableViewCell {
    
    let nameLabel = UILabel(frame: CGRect(x: 0, y: 30,  width: 250, height: 15 ))
    let scoreLabel = UILabel(frame: CGRect(x: 0, y: 30,  width: 60, height: 15 ))
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        scoreLabel.textAlignment = .right
        contentView.addSubview(scoreLabel)
        nameLabel.textAlignment = .right
        contentView.addSubview(nameLabel)
    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    }
