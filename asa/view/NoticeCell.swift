//
//  NoticeCell.swift
//  asa
//
//  Created by Fernando Hernández on 13/05/25.
//

import UIKit

class NoticeCell: UITableViewCell {
    @IBOutlet weak var tvNoticeImage: UIImageView!
    @IBOutlet weak var tvNoticeTitle: UILabel!
    @IBOutlet weak var tvNoticeBtnMore: UIButton!
    @IBOutlet weak var tvNoticeDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    // Configure the view for the selected state
    }
}
