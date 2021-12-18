//
//  SpecialNeedsAndDonationsViewController.swift
//  HackathonApp
//
//  Created by Rayan Taj on 18/12/2021.
//

import UIKit

class SpecialNeedsAndDonationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel(frame: CGRect(x: 10, y: 100, width: 200, height: 20))
        label.text = "hello"
        label.textColor = .darkGray
        
        view.addSubview(label)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
