
import UIKit
import Firebase

class ViewCommunities: UIViewController {
    
    var NameLabel = UILabel(frame: CGRect(x: 16, y: 120, width: 358, height: 20))
    var labelLocation =  UILabel(frame: CGRect(x: 16, y: 140, width: 358, height: 50))
    var labelDescraption =  UILabel(frame: CGRect(x: 16, y: 160, width: 358, height: 100))
    var joinButton = UIButton(frame: CGRect(x: 47, y: 280, width: 297, height: 31))
    
    var arrCommunities : Communities?
    let db = Firestore.firestore()
    var collectionView: UICollectionView?
    var user : [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        user = arrCommunities!.users
        
        //NameLabel
        view.addSubview(NameLabel)
        NameLabel.text =  arrCommunities?.name
        NameLabel.textAlignment = .right
        
        //labelLocation
        view.addSubview(labelLocation)
        labelLocation.text = ( "الموقع: \(arrCommunities!.location)")
        labelLocation.textAlignment = .right
        
        //labelDescraption
        view.addSubview(labelDescraption)
        labelDescraption.text = ( "الوصف: \(arrCommunities!.describe)")
        labelDescraption.textAlignment = .right
        
        
        //       join bottun
        view.addSubview(joinButton)
        joinButton.setTitle("الانضمام", for: .normal)
        joinButton.layer.cornerRadius = 13
        joinButton.addTarget(self, action: #selector(join), for: .touchDown)
        joinButton.backgroundColor =  #colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1)
        
        setupCollectionView()
    }
    
    @objc  func join(){
        
        db.collection("community").whereField("Name", isEqualTo: NameLabel.text!)
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

// MARK: - Collection View




extension ViewCommunities: UICollectionViewDelegate, UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    
    fileprivate func setupCollectionView() {
        
        collectionView = UICollectionView(frame: CGRect(x: 35, y: 345 , width: 340, height: 403 ), collectionViewLayout: UICollectionViewFlowLayout())
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        collectionView?.register( UsersViewCell.self, forCellWithReuseIdentifier: "Cell")
        view.addSubview(collectionView!)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return user.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! UsersViewCell
        cell.UserName.text = user[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105 , height: 105 )
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        return  5
    }
    
    
    
}




// MARK: - Collection View cell
class UsersViewCell : UICollectionViewCell {
    
    
    
    let db = Firestore.firestore()
    
    
    var UserName = UILabel(frame: CGRect(x: 0, y:70,  width:  90 , height: 30 ) )
    var image = UIImageView(frame: CGRect(x: 0, y:0,  width: 90 , height: 65 ) )
    
    
    override init( frame: CGRect){
        
        super.init(frame:.zero)
        
        contentView.addSubview(UserName)
        contentView.addSubview(image)
        image.image = UIImage(systemName: "person.crop.circle")
        image.tintColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
