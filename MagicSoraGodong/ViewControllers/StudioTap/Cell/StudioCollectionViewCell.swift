//
//  StudioCollectionViewCell.swift
//  MagicSoraGodong
//
//  Created by uno on 2020/10/20.
//

import UIKit

class StudioCollectionViewCell: UICollectionViewCell {
    
    // MARK:- Properties
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var checkBoxButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
