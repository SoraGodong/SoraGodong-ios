//
//  CommentTableViewCell.swift
//  MagicSoraGodong
//
//  Created by 이정인 on 2020/10/20.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    @IBOutlet weak var userId:UILabel!
    @IBOutlet weak var comment:UILabel!
    @IBOutlet weak var date:UILabel!
    
    static let cellIdentifier = "commentCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
