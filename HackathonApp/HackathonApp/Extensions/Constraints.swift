//
//  Constraints.swift
//  HackathonApp
//
//  Created by Aisha Al-Qarni on 18/12/2021.
//

import UIKit

extension UIView {
    
    func pin(to superView: UIView){
        translatesAutoresizingMaskIntoConstraints                                             = false
        topAnchor.constraint(equalTo: superView.topAnchor, constant: 150).isActive            = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 15).isActive     = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -15).isActive  = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -50).isActive      = true
    }
    
}

