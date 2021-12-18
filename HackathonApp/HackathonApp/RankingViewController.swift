//
//  RankingViewController.swift
//  HackathonApp
//
//  Created by Abdullah AlRashoudi on 12/16/21.
//

import UIKit
import Firebase
class RankingViewController: UIViewController {
    let titleLabel = UILabel(frame: CGRect(x: 15, y: 70, width: 365, height: 35))
    let db = Firestore.firestore()
    var arrayScore: [UserRank] = []
    let rankingTableView = UITableView(frame: CGRect(x: 10, y: 250, width: 365, height: 600))
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureTableView()
        //        MARK: Title label:
        titleLabel.text = "ترتيب الأعضاء"
        titleLabel.textColor =  #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 30)
        view.addSubview(titleLabel)
        //MARK: - TableView
        rankingTableView.register(RankingCell.self, forCellReuseIdentifier: "cell")
        getData()
    }
    func configureTableView(){
        view.addSubview(rankingTableView)
        setTableViewDelegates()
        rankingTableView.rowHeight = 70
        rankingTableView.pin(to: view)
    }
    func setTableViewDelegates(){
        rankingTableView.delegate = self
        rankingTableView.dataSource = self
    }
    
    func getData(){
        db.collection("Users").order(by: "score", descending: true)
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
}

struct UserRank {
    var name: String
    var rank: Int
}
