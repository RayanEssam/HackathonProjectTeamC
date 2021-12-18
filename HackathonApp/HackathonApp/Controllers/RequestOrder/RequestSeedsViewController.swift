//
//  RequestSeedsViewController.swift
//  HackathonApp
//
//  Created by nouf on 18/12/2021.

import UIKit
import MapKit
import Firebase
//import GoogleMaps
//import CoreLocation

class RequestSeedsViewController: UIViewController , MKMapViewDelegate,  CLLocationManagerDelegate {
        let customAlert = OrderAlert()
        let specialneedsAndDonations = UIButton(frame: CGRect(x: 310, y: 60, width: 60, height: 60))
        var label1 = UILabel(frame: CGRect(x: 15, y: 150, width: 360, height: 31))
        var label2 = UILabel(frame: CGRect(x: 15, y: 200, width: 360, height: 62))
        var label3 = UILabel(frame: CGRect(x: 15, y: 270, width: 360, height: 31))
    var textFieldLocation = UITextField(frame: CGRect(x: 15, y: 300, width: 360, height: 31))
       // let mapView = MKMapView(frame: CGRect(x: 15, y: 300, width: 360, height: 360))
        let map = UIView(frame: CGRect(x: 15, y: 350, width: 360, height: 300))
        let submetButton = UIButton(frame: CGRect(x: 100, y: 680, width: 180, height: 31))
        let bgImage = UIImageView()
        let db = Firestore.firestore()
        
        let orderID = UUID()
        
        var locationName = ""
        var locationDescription = ""
        
    //    let manager = CLLocationManager()

        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            
    //        for family in UIFont.familyNames.sorted() {
    //            let names = UIFont.fontNames(forFamilyName: family)
    //            print("Family: \(family) Font names: \(names)")
            
    //        GMSServices.provideAPIKey("AIzaSyDCKjBTJBxts5LKSpLmZm5JxE75jYwqgyw")
            
    //        manager.delegate = self
    //        manager.requestWhenInUseAuthorization()
    //        manager.startUpdatingLocation()
            
    //        locationManager(manager, didUpdateLocations: [CLLocation(latitude: 24.858659, longitude: 46.710210)])


    //        }
            
    //        MARK: Image:
            bgImage.image = UIImage(named: "")
            bgImage.frame = CGRect(x: 100, y: 675, width: 200, height: 150)
            view.addSubview(bgImage)
    //        MARK: Labels:
            label1.font = UIFont(name: "Harmattan-Regular", size: 20)
            label1.text = locationName
            label1.textColor = #colorLiteral(red: 0.09518901259, green: 0.3063969612, blue: 0.4679352641, alpha: 1)
            label1.font = .boldSystemFont(ofSize: 20)
            label1.textAlignment = .right
            view.addSubview(label1)
            label2.font = UIFont(name: "Harmattan-Regular", size: 16)
            label2.text = locationDescription
            label2.numberOfLines = 2
    //        label2.backgroundColor = #colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1)
            label2.textColor = #colorLiteral(red: 0.09518901259, green: 0.3063969612, blue: 0.4679352641, alpha: 1)
            label2.textAlignment = .right
            view.addSubview(label2)
            label3.font = UIFont(name: "Harmattan-Regular", size: 20)
            label3.textColor = #colorLiteral(red: 0.09518901259, green: 0.3063969612, blue: 0.4679352641, alpha: 1)
            label3.textAlignment = .right
            label3.text = "عنوان التوصيل"
            view.addSubview(label3)
            //        MARK:  textField
            view.addSubview(textFieldLocation)
            textFieldLocation.textColor = #colorLiteral(red: 0.09518901259, green: 0.3063969612, blue: 0.4679352641, alpha: 1)
            textFieldLocation.placeholder = "اكتب العنوان الخاص بك هنا"
            textFieldLocation.textAlignment = .right
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
    //        mapView.mapType = MKMapType.standard
    //        mapView.isZoomEnabled = true
    //        mapView.isScrollEnabled = true
    //        mapView.layer.cornerRadius = 13
    //        view.addSubview(mapView)
            view.addSubview(map)
            map.backgroundColor = .red
            
        }
        @objc func specialneedsAndDonationsPressed (){
            
            let specialneedsAndDonationsVC  = SpecialNeedsAndDonationsViewController()
            specialneedsAndDonationsVC.modalPresentationStyle = .fullScreen
            navigationController?.pushViewController(specialneedsAndDonationsVC, animated: true)
            
        }
        
        @objc func submetButtonPressed (){
                
                // Next page (For taking a picture and closing the order )
                
                db.collection("OrdersSeeds").document("\(orderID)").setData([
                    "email" : "\(Auth.auth().currentUser!.email!)",
                    "locationName" : "\(locationDescription)",
                    "SeedsName" : "\(locationName)",
                    
                ]) { error  in

                    if error == nil {
                     // move to the next page
                        print("Added successfully")
                        
                    }
                }

            self.customAlert.showAlert(with: "", message: "تم تقديم الطلب ", on: self)
            }
        
        
        
    //     func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    //        guard let location = locations.first else{
    //
    //            return
    //        }
    //
    //        let Latitude = 24.858659
    //        let Longitude = 46.710210
    //
    //        let cordinat = location.coordinate
    //        let camera = GMSCameraPosition.camera(withLatitude: Latitude, longitude: Longitude, zoom: 6.0)
    //        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
    //         mapView.frame = CGRect(x: 0, y: 0, width: 360, height: 360)
    //         self.map.addSubview(mapView)
    //
    //        let marker = GMSMarker()
    //        marker.position = CLLocationCoordinate2D(latitude: Latitude, longitude: Longitude)
    //        marker.title = "Riyadh"
    //        marker.snippet = "princes Norah"
    //        marker.map = mapView
    //
    //
    //
    //    }
        
        
        
    }
class OrderAlert {
    struct Constants {
        static let backgroundAlphaTo: CGFloat = 0.6
    }
    
    private var backgroundView: UIView = {
        let backgroundView = UIView()
       backgroundView.backgroundColor = .black
        backgroundView.alpha = 0
        return backgroundView
    }()
    
    private var alertView: UIView = {
        let alert = UIView()
        alert.backgroundColor = .white
        alert.layer.masksToBounds = true
        alert.layer.cornerRadius = 20
        return alert
    }()
    private var myTargetView = UIView()
    func showAlert(with title: String, message: String, on viewController: UIViewController) {
        guard let targetView = viewController.view else {return}
        myTargetView = targetView
        backgroundView.frame = targetView.bounds
        targetView.addSubview(backgroundView)
        targetView.addSubview(alertView)
        alertView.frame = CGRect(x: 40, y: -250, width: targetView.frame.size.width-80, height: 250)
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: alertView.frame.size.width, height: 50))
        titleLabel.text = title
        titleLabel.textColor = #colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1)
        titleLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        titleLabel.textAlignment = .center
        alertView.addSubview(titleLabel)
        
        let myImage = UIImageView(frame: CGRect(x:135, y: 30, width: 60, height: 60))
        myImage.tintColor = #colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1)
        myImage.image = UIImage(systemName: "checkmark.circle.fill")
     
        alertView.addSubview(myImage)
        let messageLabel = UILabel(frame: CGRect(x: 10, y: 60, width: alertView.frame.size.width, height: 130))
        messageLabel.numberOfLines = 0
        messageLabel.text = message
        messageLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        messageLabel.textColor = #colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1)
        messageLabel.textAlignment = .center
        alertView.addSubview(messageLabel)
        
        let button =  UIButton(frame: CGRect(x: 20, y: alertView.frame.size.height-70, width: alertView.frame.size.width-40, height: 50))
        button.setTitle("إخفاء", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.9411765933, green: 0.9411765337, blue: 0.9411766529, alpha: 1), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        button.backgroundColor = #colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1)
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        alertView.addSubview(button)
        
        UIView.animate(withDuration: 0.25, animations: {
            self.backgroundView.alpha = Constants.backgroundAlphaTo
        }, completion: { done in
            if done {
                
                UIView.animate(withDuration: 0.25, animations: {
                    self.alertView.center = targetView.center
                })
            }
        })
    }
    
   @objc func dismissAlert() {
       
       UIView.animate(withDuration: 0.25, animations: {
           self.alertView.frame = CGRect(x: 40, y: self.myTargetView.frame.size.height, width: self.myTargetView.frame.size.width-80, height: 250)
                  
       }, completion: { done in
           if done {
               
               UIView.animate(withDuration: 0.25, animations: {
                   self.backgroundView.alpha = 0
               }, completion: {done in
                   if done {
                       self.alertView.removeFromSuperview()
                       self.backgroundView.removeFromSuperview()
                   }
               })
           }
       })
    }
    
}

