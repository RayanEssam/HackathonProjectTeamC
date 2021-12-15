import UIKit
import MapKit

class RequestSubmissionViewController: UIViewController, MKMapViewDelegate {
    let specialneedsAndDonations = UIButton(frame: CGRect(x: 310, y: 60, width: 60, height: 60))
    var label1 = UILabel(frame: CGRect(x: 15, y: 150, width: 360, height: 31))
    var label2 = UILabel(frame: CGRect(x: 15, y: 200, width: 360, height: 31))
    var label3 = UILabel(frame: CGRect(x: 15, y: 250, width: 360, height: 31))
    let mapView = MKMapView(frame: CGRect(x: 15, y: 300, width: 360, height: 450))
    let submetButton = UIButton(frame: CGRect(x: 100, y: 770, width: 180, height: 31))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        Labels:
        label1.backgroundColor = .red
        view.addSubview(label1)
        label2.backgroundColor = .red
        view.addSubview(label2)
        label3.backgroundColor = .red
        view.addSubview(label3)
//        Buttons:
        specialneedsAndDonations.layer.cornerRadius = 0.5 * specialneedsAndDonations.bounds.size.width
        specialneedsAndDonations.clipsToBounds = true
        specialneedsAndDonations.backgroundColor = .red
        specialneedsAndDonations.setImage(UIImage(named:"charity.png"), for: .normal)
        specialneedsAndDonations.addTarget(self, action: #selector(specialneedsAndDonationsPressed), for: .touchUpInside)
        view.addSubview(specialneedsAndDonations)
        submetButton.backgroundColor = .red
        submetButton.layer.cornerRadius = 13
        submetButton.setTitle("تقديم الطلب", for: .normal)
        submetButton.addTarget(self, action: #selector(submetButtonPressed), for: .touchUpInside)
        view.addSubview(submetButton)
//        Map:
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        mapView.layer.cornerRadius = 13
        view.addSubview(mapView)
    }
    
    @objc func specialneedsAndDonationsPressed (){
        
    }
    
    @objc func submetButtonPressed (){
        
    }
}


