//
//  StudioCollectionViewCell.swift
//  MagicSoraGodong
//
//  Created by uno on 2020/10/20.
//

import UIKit

class StudioCollectionViewCell: UICollectionViewCell {
    
    // MARK:- Properties
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var checkBoxButton: UIButton!
    
    var onClickCheckBox: (() -> (Void))?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func clickCheckBox(_ sender: UIButton) {
//        guard let completionHandler = onClickCheckBox else { return }
//        completionHandler()
        if sender.isSelected {
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
    }

}
