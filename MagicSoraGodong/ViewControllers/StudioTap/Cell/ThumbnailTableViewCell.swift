//
//  ThumbnailTableViewCell.swift
//  MagicSoraGodong
//
//  Created by uno on 2020/10/23.
//

import UIKit

class ThumbnailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var videoThumbnailImage: UIImageView!
    @IBOutlet weak var uploadingPictureButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
