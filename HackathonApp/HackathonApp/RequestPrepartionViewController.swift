//
//  RequestPrepartionViewController.swift
//  HackathonApp
//
//  Created by Areej Mohammad on 11/05/1443 AH.
//

import UIKit

class RequestPrepartionViewController: UIViewController, UITableViewDataSource {
    let mySegmentedControl = UISegmentedControl (items: ["أماكن","أدوات"])
    let locationsTableView = UITableView()
    
    var locationsArray = ["Areej" , "Aishah" , "Wejdan" , "Mona" , "Rayan" , "Abduallah" , "Ebrahim" , "Najlaa"]
    
    var thingsAraay = ["اريج" , "عايشه" , "وجدان" , "منى"  , "ريان" , "عبدالله" , "ابراهيم" , "نجلاء"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Segment
        let xPostion:CGFloat = 40
        let yPostion:CGFloat = 100
        let elementWidth:CGFloat = 300
        let elementHeight:CGFloat = 30
        
        mySegmentedControl.frame = CGRect(x: xPostion, y: yPostion, width: elementWidth, height: elementHeight)
        mySegmentedControl.selectedSegmentIndex = 1
        mySegmentedControl.backgroundColor = UIColor.white
        // Add function to handle Value Changed events
        mySegmentedControl.addTarget(self, action: #selector(self.segmentedValueChanged(_:)), for: .valueChanged)
        
        
        //Table view
        locationsTableView.frame = CGRect(x: 0, y: 150, width: 500, height:600 )
        locationsTableView.backgroundView?.backgroundColor = .blue
        locationsTableView.dataSource = self
        locationsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        view.backgroundColor = .white
        self.view.addSubview(mySegmentedControl)
                self.view.addSubview(locationsTableView)
    }
    
    
    @objc func segmentedValueChanged(_ sender:UISegmentedControl!){
//        if sender.selectedSegmentIndex == 0 {
//
//        }
        
    }
    @objc func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return locationsArray.count
    }
    @objc(tableView:cellForRowAtIndexPath:) func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = locationsArray[indexPath.row]
        return cell
    }
}



