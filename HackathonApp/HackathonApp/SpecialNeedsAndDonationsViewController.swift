import UIKit

class SpecialNeedsAndDonationsViewController: UIViewController, UITableViewDataSource {
    
    let firstTitle = ["مشروع صدقة الماء","مشروع دعم لذوي الاحتياجات الخاصه","اهدني تبرع"]
    let secondTitle = ["يهدف الى ايصال المياه العذبة الى المناطق الزراعية صعبة الوصول ","يهدف الى توفير فرصة لذوي الاحتياجات الخاصة على المشاركة في المبادرة","لتكن هديتك أخرويه لوالديك أو لمن تحب، هدية يتم ارسالها بإسمك لمن ترغب لدعم المبادرة"]
    let category = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImageView()
        image.image = UIImage(named: "image")
        image.frame = CGRect(x: 20, y: 110, width: 350, height: 200)
        image.contentMode = .scaleAspectFit
        view.addSubview(image)
        
        let image2 = UIImageView(frame: .init(x: 25, y: 670, width: 350, height: 65))
        image2.image = UIImage(named: "c5")
        view.addSubview(image2)
        
        //Table view
        category.frame = CGRect(x: 0, y: 350, width: 500, height:300 )
        category.backgroundView?.backgroundColor = .white
        category.dataSource = self
        category.register(CategoryTableViewCell.self, forCellReuseIdentifier: "categoryCell")
        category.rowHeight = 120
        view.addSubview(category)
        
        view.backgroundColor = .white
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return firstTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryTableViewCell
        cell.label1.text = firstTitle[indexPath.row]
        cell.label2.text = secondTitle[indexPath.row]
//        cell.textimage.image = UIImage(named: photos[indexPath.row])
        //        cell.imageView?.image = UIImage(named: photos[indexPath.row])
        return cell
    }
    
    
    
    
    
}
