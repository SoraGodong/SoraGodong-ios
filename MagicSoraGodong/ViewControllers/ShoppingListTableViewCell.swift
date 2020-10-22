//
//  ShoppingListTableViewCell.swift
//  MagicSoraGodong
//
//  Created by hiju on 2020/10/22.
//

import UIKit

class ShoppingListTableViewCell: UITableViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var sellerLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var plusAmountButton: UIButton!
    @IBOutlet weak var minusAmountButton: UIButton!
    @IBOutlet weak var checkSelectButton: UIButton!

    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
