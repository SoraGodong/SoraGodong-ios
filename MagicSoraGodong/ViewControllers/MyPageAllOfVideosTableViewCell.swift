//
//  MyPageAllOfVideosTableViewCell.swift
//  MagicSoraGodong
//
//  Created by hiju on 2020/10/22.
//

import UIKit

class MyPageAllOfVideosTableViewCell: UITableViewCell {
    
    //MARK: Properties
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var videoItem: UILabel!
    
    
    //MARK: UI
    
    func update(video:Video){
        self.thumbnail.loadImage(url: video.thumbURL)
        self.videoTitle.text = video.title
        self.videoItem.text = video.itemtitle
    }
    
}
