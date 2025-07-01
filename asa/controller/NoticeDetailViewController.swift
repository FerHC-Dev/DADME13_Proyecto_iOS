import UIKit

class NoticeDetailViewController: UIViewController {
    
    var notice: Notice?
    
    @IBOutlet weak var imgNoticeDetail: UIImageView!
    @IBOutlet weak var titleNoticeDetail: UILabel!
    @IBOutlet weak var detailNoticeDetail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(notice ?? "No llego")
        if notice != nil{
            titleNoticeDetail.text = notice?.title
            imgNoticeDetail.image = UIImage(named: "temp")
            detailNoticeDetail.text = notice?.detail
        }
    }
    


}
