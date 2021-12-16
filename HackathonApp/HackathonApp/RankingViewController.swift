//
//  RankingViewController.swift
//  HackathonApp
//
//  Created by Abdullah AlRashoudi on 12/16/21.
//

import UIKit
import Firebase
class RankingViewController: UIViewController {
    let db = Firestore.firestore()
    var arrayScore: [UserRank] = []
    let rankingTableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
       //MARK: - TableView
        rankingTableView.frame = CGRect(x: 0 , y: 200 , width: view.bounds.width , height: 600)
        rankingTableView.delegate = self
        rankingTableView.dataSource = self
        rankingTableView.register(RankingCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(rankingTableView)
        getData()
    }
    
    func getData(){
        db.collection("Users").order(by: "score")
        
        .getDocuments { querySnapshot, error in
            
            if error == nil {
                for doc in querySnapshot!.documents {
                    
                    let name = doc.get("name")!
                    let score = doc.get("score")!
                    self.arrayScore.append(UserRank(name: name as! String, rank: score as! Int))
                }
                
                self.rankingTableView.reloadData()
            } else {
                print(error!.localizedDescription)
            }
        }
    
    }
}

extension RankingViewController: UITableViewDelegate , UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayScore.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RankingCell
        cell.nameLabel.text = arrayScore[indexPath.row].name
        cell.scoreLabel.text = "\(arrayScore[indexPath.row].rank)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
}

struct UserRank {
var name: String
var rank: Int
}
