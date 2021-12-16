

import UIKit

class RequestPrepartionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let mySegmentedControl = UISegmentedControl (items: ["أماكن","أدوات"])
    let locationsTableView = UITableView()
    
    
    var displayArray :  [Any] = placesArr
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationsTableView.delegate = self
        locationsTableView.dataSource = self
        
        
        // Segment
        let xPostion:CGFloat = 40
        let yPostion:CGFloat = 100
        let elementWidth:CGFloat = 300
        let elementHeight:CGFloat = 30
        
        mySegmentedControl.frame = CGRect(x: xPostion, y: yPostion, width: elementWidth, height: elementHeight)
        mySegmentedControl.selectedSegmentIndex = 0
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
        if sender.selectedSegmentIndex == 0 {
            displayArray = placesArr
        }else{
            displayArray = suppliesArr
        }
        locationsTableView.reloadData()
        
    }
    @objc func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return displayArray.count
    }
    @objc(tableView:cellForRowAtIndexPath:) func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        //  Create cells from the places array
        if mySegmentedControl.selectedSegmentIndex == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = placesArr[indexPath.row] .name
            return cell
            
        }else{
            //  Create cells from the Supplies array
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = suppliesArr[indexPath.row] .name
            return cell
            
        }
        
      
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if mySegmentedControl.selectedSegmentIndex == 0 {
           
            let placeItem = tableView.cellForRow(at: indexPath)

            let requestSubmmition = RequestSubmissionViewController()
            
            requestSubmmition.locationName = placesArr[indexPath.row] .name
            requestSubmmition.locationDescription = placesArr[indexPath.row].description
            requestSubmmition.modalPresentationStyle = .fullScreen
            navigationController?.pushViewController(requestSubmmition, animated: true)

            
        }else{
       
            let placeItem = tableView.cellForRow(at: indexPath)

            let requestSubmmition = RequestSubmissionViewController()
            requestSubmmition.modalPresentationStyle = .fullScreen
            navigationController?.pushViewController(requestSubmmition, animated: true)

            
            
        }
        
  
        
    }
    
    
    

    
}



