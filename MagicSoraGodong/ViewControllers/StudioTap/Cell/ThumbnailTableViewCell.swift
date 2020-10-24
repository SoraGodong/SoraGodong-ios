//
//  ThumbnailTableViewCell.swift
//  MagicSoraGodong
//
//  Created by uno on 2020/10/23.
//

import UIKit
import Photos

class ThumbnailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var videoThumbnailImage: UIImageView!
    @IBOutlet weak var mediaButton: UIButton!
//    let mediaPickerManager = MediaPickerManager()
    var completionHandler: (() -> (Void))?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        mediaPickerManager.mediaPickerDelegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

// MARK:- Methods
extension ThumbnailTableViewCell {
    
    @IBAction func touchUpButton(_ sender: UIButton) {
        guard let completionHandler = completionHandler else { return }
        completionHandler()
    }
    
}


