//
//  StudioProduct.swift
//  MagicSoraGodong
//
//  Created by uno on 2020/10/23.
//

import UIKit

// MARK:- Product Category
enum ProductCategoryNumber: Int, CaseIterable {
    
    case whole = 0
    case food
    case digital
    case beauty
    
}

// MARK:- Studio Collection's Product Model
struct Product {
    
    let productImageName: String?
    let productTitle: String?
    let productPrice: Int?
    var check: Bool?
    
    init(productImageName: String, productTitle: String, productPrice: Int, check: Bool) {
        self.productImageName = productImageName
        self.productTitle = productTitle
        self.productPrice = productPrice
        self.check = check
    }
    
}


// MARK:- Studio Registration's Selected Product Singleton Model
class SelectedProduct {
    
    static let shared = SelectedProduct()
    
    var products: [Product] = []
    
    struct Product {
        let tagNumber: Int?
        let productImageName: String?
        let productTitle: String?
        let productPrice: Int?
    }
    
}

