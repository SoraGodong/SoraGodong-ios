//
//  StudioCollectionHeaderReusableView.swift
//  MagicSoraGodong
//
//  Created by uno on 2020/10/21.
//

import UIKit

class StudioCollectionHeaderReusableView: UICollectionViewCell {
    
    //UICollectionReusableView
    // MARK:- Properties
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    let categories = StudioCategoty.categories
    var categoryButtons: [UIButton] = []
    var completionHandler: ((_ index: Int) -> (Void))?
    
    // MARK:- Nib Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureCategory()
        scrollView.showsHorizontalScrollIndicator = false
    }
    
}

// MARK:- Cofigure UI
extension StudioCollectionHeaderReusableView {
    
    func configureCategory() {
        
        for index in 0 ..< categories.count {
            let categoryButton = UIButton()
            categoryButton.tag = index
            categoryButton.setTitle(categories[index], for: .normal)
            categoryButton.setTitleColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: .normal)
            categoryButton.translatesAutoresizingMaskIntoConstraints = false
            categoryButton.addTarget(self, action: #selector(touchUpCategoryButton(_:)), for: .touchUpInside)
            categoryView.addSubview(categoryButton)
            categoryButton.centerYAnchor.constraint(
                equalTo: categoryView.centerYAnchor
            ).isActive = true
            categoryButtons.append(categoryButton)
            categoryButton.leadingAnchor.constraint(
                equalTo: index == 0 ? categoryView.leadingAnchor : categoryButtons[index - 1].trailingAnchor,
                constant: 18).isActive = true
        }
        categoryButtons[0].setTitleColor(#colorLiteral(red: 0.5169164538, green: 0.689781487, blue: 0.9588938355, alpha: 1), for: .normal)
    }
    
}

// MARK:- Methods
extension StudioCollectionHeaderReusableView {
    
    @objc func touchUpCategoryButton(_ sender: UIButton) {
        guard let completionHandler = completionHandler else { return }

        for index in 0 ..< categoryButtons.count {
            if sender.tag == index {
                categoryButtons[index].setTitleColor(#colorLiteral(red: 0.5169164538, green: 0.689781487, blue: 0.9588938355, alpha: 1), for: .normal)
            } else {
                categoryButtons[index].setTitleColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: .normal)
            }
        }
        completionHandler(sender.tag <= 4 ? sender.tag : 0)
        
    }
    
}

