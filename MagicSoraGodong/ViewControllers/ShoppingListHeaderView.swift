//
//  ShoppingListHeaderView.swift
//  MagicSoraGodong
//
//  Created by hiju on 2020/10/22.
//

import UIKit

class ShoppingListHeaderView: UITableViewHeaderFooterView {
    
    //MARK: Properties
    
    internal lazy var shoppingListLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 30, weight: .semibold)
        label.text = "장바구니"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    internal lazy var totalItemsAmountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    //MARK: Auto Layout
    
    override func draw(_ rect: CGRect) {
        
        addSubview(shoppingListLabel)
        addSubview(totalItemsAmountLabel)
        
        shoppingListLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
        shoppingListLabel.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
        
        totalItemsAmountLabel.topAnchor.constraint(equalTo: shoppingListLabel.bottomAnchor, constant: 30).isActive = true
        totalItemsAmountLabel.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
        
    }
    

}
