//
//  VlogSingleton.swift
//  MagicSoraGodong
//
//  Created by uno on 2020/10/25.
//

import UIKit
import Photos

class VlogData {
    static let shared = VlogData()
    
    var videoTitle : String?
    var vidoeContent : String?
    var videoAseet : AVAsset?
    var videoImage : UIImage?
}
