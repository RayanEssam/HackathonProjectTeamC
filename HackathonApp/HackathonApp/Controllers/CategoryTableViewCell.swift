import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    let label1 = UILabel(frame: .init(x: 20, y: 0, width: 350, height: 40))
    let label2 = UILabel(frame: .init(x: 20, y: 25, width: 350, height: 80))
    override func awakeFromNib() {
        super.awakeFromNib()
       
           }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        label1.font = .boldSystemFont(ofSize: 20)
        label1.textAlignment = .center
        label1.textColor = #colorLiteral(red: 0.5040584803, green: 0.6786125302, blue: 0.3246438801, alpha: 1)
        
        label2.font = .systemFont(ofSize: 15)
        label2.textAlignment = .center
        label2.numberOfLines = 0
        
        contentView.addSubview(label1)
        contentView.addSubview(label2)
//        contentView.addSubview(textimage)
    }

}

