//
//  StudioCollectionHeaderReusableView.swift
//  MagicSoraGodong
//
//  Created by uno on 2020/10/21.
//

import UIKit

class StudioCollectionHeaderReusableView: UICollectionReusableView {
    
    // MARK:- Properties
    @IBOutlet weak var categoryView: UIView!
    let categories = categoty.categories
    var categoryButtons: [UIButton] = []
    var collectionView: UICollectionView?
    
    // MARK:- Nib Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureCategory()
    }
    
}

// MARK:- Cofigure UI
extension StudioCollectionHeaderReusableView {
    
    func configureCategory() {
        
        for index in 0 ..< categories.count {
            let categoryButton = UIButton()
            categoryButton.tag = index
            categoryButton.setTitle(categories[index], for: .normal)
            categoryButton.setTitleColor(.lightGray, for: .normal)
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
    }
    
}

// MARK:- Methods
extension StudioCollectionHeaderReusableView {
    
    @objc func touchUpCategoryButton(_ sender: UIButton) {
        for index in 0 ..< categoryButtons.count {
            if sender.tag == index {
                categoryButtons[index].setTitleColor(.black, for: .normal)
            } else {
                categoryButtons[index].setTitleColor(.lightGray, for: .normal)
            }
        }
        collectionView?.reloadSections(IndexSet(0...0))
    }
    
}

