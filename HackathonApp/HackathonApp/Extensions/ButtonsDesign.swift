//
//  ButtonsDesign.swift
//  HackathonApp
//
//  Created by Aisha Al-Qarni on 16/12/2021.
//

import UIKit

extension UIButton {
    func createFloatActionButton(){
    layer.cornerRadius = frame.height / 2
    layer.shadowOpacity = 0.25
    layer.shadowRadius = 5
    layer.shadowOffset = CGSize(width: 0, height: 5)
    }
    
    func createShadowButton(){
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 0, height: 5)
    }
}
