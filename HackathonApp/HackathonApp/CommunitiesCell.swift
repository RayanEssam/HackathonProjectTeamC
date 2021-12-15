//
//  CommunitiesCell.swift
//  HackathonApp
//
//  Created by nouf on 15/12/2021.
//

import UIKit

class CommunitiesCell: UITableViewCell {

   
        
        
    var labelName = UILabel(frame: CGRect(x: 106, y: 11,  width: 350, height: 15 ))
        var labelDescraption  = UILabel(frame: CGRect(x: 106, y: 69 , width: 254 , height: 25 ))
        var joinButton = UIButton(frame: CGRect(x:  16 , y: 34 , width: 83 , height: 40 ))
        
        override func awakeFromNib() {
            super.awakeFromNib()
            
            
            
        }
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            
            contentView.addSubview(labelName)
            contentView.addSubview(labelDescraption)
            contentView.addSubview(joinButton)
            joinButton.addTarget(self, action: #selector(join), for: .touchDown)
            
            
            joinButton.layer.cornerRadius = 20
            joinButton.backgroundColor = #colorLiteral(red: 0, green: 0.3955854177, blue: 0, alpha: 0.6980392157)
            
        }
        
        
        
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        @objc  func join(){
            print("is join")
        }
        
        
    }


