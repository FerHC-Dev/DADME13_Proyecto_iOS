import UIKit

class ServOperacionalCell: UITableViewCell {
    @IBOutlet weak var imgServOp: UIImageView!
    @IBOutlet weak var titleServOp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        //print("Selected Notice Cell : \(selected)")
    }
}
