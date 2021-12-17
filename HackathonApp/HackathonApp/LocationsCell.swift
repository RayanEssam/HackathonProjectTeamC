//
//  LocationsCell.swift
//  HackathonApp
//
//  Created by Areej Mohammad on 11/05/1443 AH.
//

import UIKit

class LocationsCell: UITableViewCell {
    
    let location = UILabel(frame: CGRect(x: 0, y: 30,  width: 370, height: 15 ))
    let desciption = UILabel(frame: CGRect(x: 15, y: 60,  width: 360, height: 40 ))
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        location.textColor = #colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1)
        location.font = .boldSystemFont(ofSize: 18)
       
            location.textAlignment = .right
//        location.backgroundColor = .red
        desciption.textColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        desciption.font = .systemFont(ofSize: 14)
        desciption.numberOfLines = 2
        desciption.text = "منتزه الملك سلمان البري ببنبان شمال مدينة الرياض"
        desciption.textAlignment = .right
        desciption.backgroundColor = .red
        contentView.addSubview(desciption)
            contentView.addSubview(location)

    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

