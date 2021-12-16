//
//  TextfieldsDesign.swift
//  HackathonApp
//
//  Created by Aisha Al-Qarni on 16/12/2021.
//

import UIKit

extension UITextField {
    
    func customTextfield (){
        let underLineView = UIView()
        underLineView.translatesAutoresizingMaskIntoConstraints = false
        underLineView.backgroundColor = #colorLiteral(red: 0.3152361512, green: 0.7147678137, blue: 0.6022301912, alpha: 1)
        addSubview(underLineView)
        NSLayoutConstraint.activate([
            underLineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            underLineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            underLineView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            underLineView.heightAnchor.constraint(equalToConstant: 1 )
        ])
    }
}

extension UITextField{
    @IBInspectable var placeholderColor: UIColor? {
        get {return self.placeholderColor}
        set {self.attributedPlaceholder = NSAttributedString(string: self.placeholder != nil ? self.placeholder! : "", attributes: [NSAttributedString.Key.foregroundColor : newValue!])}
    }
}
