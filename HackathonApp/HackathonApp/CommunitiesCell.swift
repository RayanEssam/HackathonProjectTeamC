//
//  CommunitiesCell.swift
//  HackathonApp
//
//  Created by nouf on 15/12/2021.
//

import UIKit
import Firebase

class CommunitiesCell: UITableViewCell {
    
    let db = Firestore.firestore()
    
    
    var labelName = UILabel(frame: CGRect(x: 144, y: 20,  width: 226 , height: 15 ))
    var labelDescraption  = UILabel(frame: CGRect(x: 166, y: 30 , width: 204 , height: 80 ))
    var joinButton = UIButton(frame: CGRect(x:  16 , y: 34 , width: 83 , height: 40 ))
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        contentView.addSubview(labelName)
        contentView.addSubview(labelDescraption)
        contentView.addSubview(joinButton)
        
        labelName.textAlignment = .right
        
        labelDescraption.numberOfLines = 3
        labelDescraption.textAlignment = .right
        
        joinButton.addTarget(self, action: #selector(join), for: .touchDown)
        joinButton.layer.cornerRadius = 20
        joinButton.backgroundColor = #colorLiteral(red: 0, green: 0.3955854177, blue: 0, alpha: 0.6980392157)
        
    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc  func join(){
        
        db.collection("community").whereField("Name", isEqualTo: labelName.text!)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err.localizedDescription)")
                } else {
                    for document in querySnapshot!.documents {
                        let documents =  document.documentID
                        
                        print("document.documentID :  " , documents )
                        let data = document.data()
                        let users = data["Users"] as! [String]
                        var temp : [String] =  users
                        temp.append("\(Auth.auth().currentUser!.email!)")
                        
                        self.db.collection("community").document(documents).updateData([
                            "Users" :    temp ,
                        ])
                        print("is join")
                    }
                }
            }
        
    }
    
    
}


