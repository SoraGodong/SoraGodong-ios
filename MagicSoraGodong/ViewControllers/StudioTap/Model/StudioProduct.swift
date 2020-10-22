//
//  StudioProduct.swift
//  MagicSoraGodong
//
//  Created by uno on 2020/10/23.
//

import UIKit

enum ProductCategoryNumber: Int, CaseIterable {
    case whole = 0
    case food
    case digital
    case beauty
}

class StudioProduct {
    
    let products: [product] = []
    
    struct product {
        var categoryNumber: Int?
        var productImage: UIImage?
        var productName: String?
        var productPrice: String?
    }
}

class SelectedProduct {
    static let shared = SelectedProduct()
    
    let products: [Product] = []
    
    struct Product {
        let productImageName: String?
        let productTitle: String?
        let productPrice: Int?
    }
}
