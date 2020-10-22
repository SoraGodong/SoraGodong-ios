//
//  HomeTableViewCell.swift
//  MagicSoraGodong
//
//  Created by 이정인 on 2020/10/20.
//

 
import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnail:UIImageView!
    @IBOutlet weak var profile:UIImageView!
    @IBOutlet weak var videoTitle:UILabel!
    @IBOutlet weak var videoItem:UILabel!
    
    
    
    func update(video:Video){
        self.thumbnail.loadImage(url: video.thumbURL)
        //self.profile.loadImage(url: video.profile)
        self.videoTitle.text = video.title
        self.videoItem.text = video.subtitle
    }
    static let cellIdentifier = "homeCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
