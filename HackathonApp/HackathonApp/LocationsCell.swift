//
//  LocationsCell.swift
//  HackathonApp
//
//  Created by Areej Mohammad on 11/05/1443 AH.
//

import UIKit

class LocationsCell: UITableViewCell {
    
    let location = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        location.frame = CGRect(x: 0, y: 0, width: 500, height: 40)
        self.addSubview(location)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
