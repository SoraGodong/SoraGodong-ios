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
    let mediaPickerManager = MediaPickerManager()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

// MARK:- Methods
extension ThumbnailTableViewCell {
    
//    @IBAction func imageBtnTapped(_ sender: UIButton) {
//        PHPhotoLibrary.checkPermission { isSuccess in
//            DispatchQueue.main.async {
//                if isSuccess {
//                    self.present(self.mediaPickerManager.imagePicker, animated: true, completion: nil)
//                }
//            }
//        }
//    }
    
}


