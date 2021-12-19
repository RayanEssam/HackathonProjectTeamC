//
//  RequestConfirmationViewController.swift
//  HackathonApp
//
//  Created by WjdanMo on 17/12/2021.
//

import UIKit
import Firebase
import Lottie

class RequestConfirmationViewController: UIViewController {
    
    var animationview : AnimationView?
    let progressState = UILabel()
    let confirmPlanting = UIButton()
    let imagePicker = UIImagePickerController()
    let label = UILabel()
    let incrementNumberOfTrees = UIButton()
    let decrementNumberOfTrees = UIButton()
    let numberOfTreesLabel = UILabel()
    var numberOfTrees = 0
    var score = 0
    
    var orderID : UUID?
    var currentUserNumberOfTrees = 0
    var currentUserScore = 0
    
    let db = Firestore.firestore()
    var locationName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        getUserData()
    }
    
    func setup(){
        
        view.backgroundColor = .white
        animationview = .init(name: "plant-progress-animation")
        animationview?.frame = view.bounds
        animationview?.loopMode = .loop
        animationview?.animationSpeed = 1
        //        animationview.backgroundColor = #colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1)
        animationview?.frame = CGRect(x: (view.frame.width / 2) - 100, y: 200, width: 200, height: 200)
        view.addSubview(animationview!)
        animationview?.play()
        
        // read from firebase firestore
        progressState.text = "جاري المعالجة ..."
        progressState.textColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
        progressState.frame = CGRect(x: 0, y: 400, width: view.frame.width, height: 50)
        progressState.textAlignment = .center
        view.addSubview(progressState)
        
        label.text = "عدد الاشجار التي تمت زراعتها"
        label.frame = CGRect(x: 0, y: 480, width: view.frame.width, height: 30)
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = .black
        view.addSubview(label)
        
        incrementNumberOfTrees.frame = CGRect(x: 130, y: 500, width: 40, height: 40)
        incrementNumberOfTrees.setTitle("+", for: .normal)
        incrementNumberOfTrees.setTitleColor( #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1) , for: .normal)
        incrementNumberOfTrees.addTarget(self, action: #selector(numberOfTreesIncremented), for: .touchUpInside)
        view.addSubview(incrementNumberOfTrees)
        
        numberOfTreesLabel.text = String(numberOfTrees)
        numberOfTreesLabel.frame = CGRect(x: 190, y: 500, width: 40, height: 40)
        numberOfTreesLabel.font = .boldSystemFont(ofSize: 17)
        numberOfTreesLabel.textColor = .black
        view.addSubview(numberOfTreesLabel)
        
        decrementNumberOfTrees.frame = CGRect(x: 220, y: 500, width: 40, height: 40)
        decrementNumberOfTrees.setTitle("-", for: .normal)
        decrementNumberOfTrees.setTitleColor( #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1) , for: .normal)
        decrementNumberOfTrees.addTarget(self, action: #selector(numberOfTreesDecremented), for: .touchUpInside)
        view.addSubview(decrementNumberOfTrees)
        
        // take pics
        confirmPlanting.frame = CGRect(x: (view.frame.width / 2) - 110, y: 550, width: 220, height: 30)
        confirmPlanting.setTitle("التقط صورة لإتمام العملية ", for: .normal)
        confirmPlanting.setTitleColor(.white, for: .normal)
        confirmPlanting.backgroundColor = #colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1)
        confirmPlanting.layer.cornerRadius = 13
        confirmPlanting.createShadowButton()
        confirmPlanting.addTarget(self, action: #selector(showImagePicker), for: .touchUpInside)
        view.addSubview(confirmPlanting)
        
    }
    
    @objc func numberOfTreesIncremented(){
        
        numberOfTrees += 1
        numberOfTreesLabel.text = String(numberOfTrees)
        
    }
    
    @objc func numberOfTreesDecremented(){
        
        if numberOfTrees > 0{
            numberOfTrees -= 1
            numberOfTreesLabel.text = String(numberOfTrees)
        }
        
    }
    
    @objc func showImagePicker(){
        
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false
        self.present(imagePicker, animated: true, completion: nil)
        
    }
    
    
    func getUserData(){
        
        // 1- got to the data base and get all the current user info (by email)
        // store it locally here
        
        db.collection("Users").whereField("email", isEqualTo: Auth.auth().currentUser!.email!)
        
            .getDocuments { querySnapshot, error in
                
                if error == nil {
                    
                    
                    let score = querySnapshot?.documents[0].get("score")!
                    let numberOfTrees = querySnapshot?.documents[0].get("numberOfTrees")!
                    
                    //                    print("score : " , score)
                    //                    print("number of Trees : ",numberOfTrees)
                    
                    
                    self.currentUserScore = score as! Int
                    self.currentUserNumberOfTrees = numberOfTrees as! Int
                    
                    //                    self.result =  self.currentUserNumberOfTrees * 3 +  self.currentUserScore
                    //                    print("..........................................")
                    //
                    
                    
                    
                    
                    print( "currentUserScore : " ,self.currentUserScore + self.currentUserNumberOfTrees * 3 )
                    
                    
                    
                    
                    print( "currentUserNumberOfTrees : " ,self.currentUserNumberOfTrees)
                    
                    print( "result : : " ,self.score)
                    
                    
                } else {
                    print(error!.localizedDescription)
                }
            }
    }
}

extension RequestConfirmationViewController : UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let _ = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            
//            if let orderID = orderID{
                db.collection("Orders").whereField("isCompleted", isEqualTo: false).getDocuments {
                    querySnapshot, error in
                    
                    if let querySnapshotDocs = querySnapshot?.documents{
                        for doc in querySnapshotDocs {
                            
                            doc.reference.updateData(["isCompleted" : true])
                            doc.reference.updateData(["nuberOfTrees" : self.numberOfTrees])
                            
                        }
                        if let error = error {
                            print("Error updating document: \(error)")
                        } else {
                            print("Document successfully updated")
                        }
                    }
                }
                
                if let email = Auth.auth().currentUser?.email{
                    db.collection("Users").whereField("email", isEqualTo: email ).getDocuments {
                        querySnapshot, error in
                        
                        if let querySnapshotDocs = querySnapshot?.documents{
                            for doc in querySnapshotDocs {
                                // work     HERE
                                doc.reference.updateData(["numberOfTrees" : self.numberOfTrees as! Int + self.currentUserNumberOfTrees])
                                let temp = self.numberOfTrees * 3
                                doc.reference.updateData(["score" :  self.currentUserScore + temp])
                                
                                // doc.reference.updateData(["score" : self.scoreas! Int + self.currentUserScore])
                                
                            }
                        }
                        if let error = error {
                            print("Error updating document: \(error.localizedDescription)")
                            
                            
                        } else {
                            print("Document successfully updated")
                            
                        }
                    }
                }
                
                picker.dismiss(animated: true, completion: nil)
                navigationController?.popToRootViewController(animated: true)
                
                
//            } else {
//                print("error")
//            }
        }
    }
}
    
    
