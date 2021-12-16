import UIKit
import MapKit
import Firebase

class RequestSubmissionViewController: UIViewController, MKMapViewDelegate {
    let specialneedsAndDonations = UIButton(frame: CGRect(x: 310, y: 60, width: 60, height: 60))
    var label1 = UILabel(frame: CGRect(x: 15, y: 150, width: 360, height: 31))
    var label2 = UILabel(frame: CGRect(x: 15, y: 200, width: 360, height: 31))
    var label3 = UILabel(frame: CGRect(x: 15, y: 250, width: 360, height: 31))
    let mapView = MKMapView(frame: CGRect(x: 15, y: 300, width: 360, height: 360))
    let submetButton = UIButton(frame: CGRect(x: 100, y: 670, width: 180, height: 31))
    let bgImage = UIImageView()
    let db = Firestore.firestore()
    
    var locationName = ""
    var locationDescription = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
//        for family in UIFont.familyNames.sorted() {
//            let names = UIFont.fontNames(forFamilyName: family)
//            print("Family: \(family) Font names: \(names)")
//        }
        
//        MARK: Image:
        bgImage.image = UIImage(named: "")
        bgImage.frame = CGRect(x: 100, y: 675, width: 200, height: 150)
        view.addSubview(bgImage)
//        MARK: Labels:
        label1.font = UIFont(name: "Harmattan-Regular", size: 16)
        label1.text = locationName
        label1.textColor = #colorLiteral(red: 0.09518901259, green: 0.3063969612, blue: 0.4679352641, alpha: 1)
        label1.textAlignment = .right
        view.addSubview(label1)
        label2.font = UIFont(name: "Harmattan-Regular", size: 16)
        label2.text = locationDescription
//        label2.backgroundColor = #colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1)
        label2.textColor = #colorLiteral(red: 0.09518901259, green: 0.3063969612, blue: 0.4679352641, alpha: 1)
        label2.textAlignment = .right
        view.addSubview(label2)
        label3.backgroundColor = #colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1)
        label3.textColor = #colorLiteral(red: 0.09518901259, green: 0.3063969612, blue: 0.4679352641, alpha: 1)
        label3.textAlignment = .right
        view.addSubview(label3)
//        MARK: Buttons:
        specialneedsAndDonations.createFloatActionButton()
        specialneedsAndDonations.layer.shadowOffset = CGSize(width: 0, height: 5)
        specialneedsAndDonations.backgroundColor = #colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1)
        specialneedsAndDonations.setImage(UIImage(named:"charity.png"), for: .normal)
        specialneedsAndDonations.addTarget(self, action: #selector(specialneedsAndDonationsPressed), for: .touchUpInside)
        view.addSubview(specialneedsAndDonations)
        submetButton.backgroundColor = #colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1)
        submetButton.layer.cornerRadius = 13
        submetButton.createShadowButton()
        submetButton.setTitle("تقديم الطلب", for: .normal)
        submetButton.addTarget(self, action: #selector(submetButtonPressed), for: .touchUpInside)
        view.addSubview(submetButton)
//        MARK: Map:
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        mapView.layer.cornerRadius = 13
        view.addSubview(mapView)
        
    }
    @objc func specialneedsAndDonationsPressed (){
        
    }
    
    @objc func submetButtonPressed (){
        
        // Next page (For taking a picture and closing the order )
        
        db.collection("Orders").addDocument(data: [
        
            "email" : "\(Auth.auth().currentUser!.email!)",
            "isCompleted" : false,
            "locationName" : "\(locationName)"

        ]) { error  in

            if error == nil {
             // move to the next page
                print("Added successfully")
                
            }
        }
        
        
    }
}


