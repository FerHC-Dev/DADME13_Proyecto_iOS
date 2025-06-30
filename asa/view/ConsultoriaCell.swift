import UIKit

class ConsultoriaCell: UITableViewCell {
    
    
    @IBOutlet weak var imgConsultoria: UIImageView!
    @IBOutlet weak var titleConsultoria: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        //print("Selected Notice Cell : \(selected)")
    }
}
