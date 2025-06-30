import UIKit

class ServComplementarioCell: UITableViewCell {
    
    @IBOutlet weak var imgServCom: UIImageView!
    @IBOutlet weak var titleServCom: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        //print("Selected Notice Cell : \(selected)")
    }
}
