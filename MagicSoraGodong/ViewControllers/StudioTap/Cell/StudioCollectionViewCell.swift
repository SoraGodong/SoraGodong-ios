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
        checkBoxButton.tintColor = #colorLiteral(red: 0.7900478244, green: 0.7798151374, blue: 0.7973746657, alpha: 1)
    }
    
//    @IBAction func clickCheckBox(_ sender: UIButton) {
////        guard let completionHandler = onClickCheckBox else { return }
////        completionHandler()
//        if sender.isSelected {
//            sender.isSelected = false
//        } else {
//            sender.isSelected = true
//        }
//    }

}
