//
//  CommunitiesViewController.swift
//  HackathonApp
//
//  Created by Rayan Taj on 15/12/2021.
//

import UIKit
import Firebase



class CommunitiesViewController: UIViewController {
    
    let db = Firestore.firestore()
    
    var communitiesTableView : UITableView?
    var communitiesArray : [Communities] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getData()
        
        
        // Do any additional setup after loading the view.
    }
    
    func getData() {
        
        db.collection("community").getDocuments{ (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                
                for document in querySnapshot!.documents {
                    let data = document.data()
                    print(data)
                    let  description = data["Description"] as! String
                    let name =  data["Name"] as! String
                    self.communitiesArray.append(Communities(name: name , describe: description))
                    print(self.communitiesArray)
                }
                self.communitiesTableView!.reloadData()
            }
        }
        
    }
    
}

extension CommunitiesViewController: UITableViewDelegate , UITableViewDataSource  {
    fileprivate func setupTableView() {
        
        communitiesTableView  =  UITableView(frame: CGRect(x: 0 , y: 0 , width: view.bounds.width , height:view.bounds.height))
        communitiesTableView?.delegate = self
        communitiesTableView?.dataSource = self
        communitiesTableView?.register(CommunitiesCell.self, forCellReuseIdentifier: "TableViewCell")
        
        
        view.addSubview(communitiesTableView!)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  communitiesArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! CommunitiesCell
        
        cell.labelName.text = communitiesArray[indexPath.row].name
        cell.labelDescraption.text = communitiesArray[indexPath.row].describe
        cell.joinButton.setTitle("الانضمام", for: .normal)
        cell .layer.cornerRadius = 20
        cell.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        
        
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        return 150
        
    }
    
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 34
        }
    
}









struct Communities {
    
    var name : String
    var describe : String
    
    
}


