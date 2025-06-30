import UIKit

class NoticeCell: UITableViewCell {
    
    protocol NoticeDelegate: AnyObject {
        func showNoticeDetail(_ celda: NoticeCell)
    }
    
    @IBOutlet weak var tvNoticeImage: UIImageView!
    @IBOutlet weak var tvNoticeTitle: UILabel!
    @IBOutlet weak var tvNoticeBtnMore: UIButton!
    @IBOutlet weak var tvNoticeDate: UILabel!
    
    weak var delegate: NoticeDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        print("Selected Notice Cell : \(selected)")
    }
    
    @IBAction func tvNoticeBtnMore(_ sender: UIButton) {
        delegate?.showNoticeDetail(self)
    }
}
