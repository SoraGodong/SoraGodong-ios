//
//  StudioProduct.swift
//  MagicSoraGodong
//
//  Created by uno on 2020/10/23.
//

import UIKit

// MARK:- Category of Studio Product
class StudioCategoty {
    
    static var categories = ["전체", "뷰티", "디지털", "푸드", "가구", "의류", "가전", "주방", "애견", "도서", "스포츠"]
    
}

// MARK:- Product Category
enum ProductCategory: Int, CaseIterable {
    
    case total = 0
    case beauty
    case digital
    case food
    case furniture
    
}

// MARK:- Studio Collection's Product Model
class StudioProduct {
    
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
    
    static var beautyProducts: [Product] = [
        Product(productImageName: "beauty1", productTitle: "aloe", productPrice: 13000, check: false),
        Product(productImageName: "beauty2", productTitle: "lipstick", productPrice: 8000, check: false),
        Product(productImageName: "beauty", productTitle: "foundation", productPrice: 80000, check: false),
        Product(productImageName: "nars", productTitle: "Glow Cushion", productPrice: 60000, check: false),
        Product(productImageName: "beauty3", productTitle: "emple", productPrice: 15000, check: false),
        Product(productImageName: "beauty4", productTitle: "tomato", productPrice: 15000, check: false),
        Product(productImageName: "beauty5", productTitle: "pouch", productPrice: 20000, check: false),
        Product(productImageName: "beauty6", productTitle: "pink set", productPrice: 30000, check: false)
    ]
    static var digitalProducts: [Product] = [
        Product(productImageName: "digital1", productTitle: "cuty", productPrice: 5000, check: false),
        Product(productImageName: "digital2", productTitle: "phone", productPrice: 800000, check: false),
        Product(productImageName: "digital3", productTitle: "camera", productPrice: 500000, check: false),
        Product(productImageName: "digital4", productTitle: "watch", productPrice: 200000, check: false),
        Product(productImageName: "digital5", productTitle: "camera", productPrice: 500000, check: false),
        Product(productImageName: "digital6", productTitle: "camera", productPrice: 500000, check: false)
    ]
    static var foodProducts: [Product] = [
        Product(productImageName: "food1", productTitle: "berry", productPrice: 5000, check: false),
        Product(productImageName: "food2", productTitle: "toast", productPrice: 4000, check: false),
        Product(productImageName: "food3", productTitle: "strawberry", productPrice: 8000, check: false),
        Product(productImageName: "food4", productTitle: "noodle", productPrice: 2000, check: false),
        Product(productImageName: "food5", productTitle: "burger", productPrice: 3000, check: false),
        Product(productImageName: "food6", productTitle: "stake", productPrice: 12000, check: false)
    ]
    static var furnitureProducts: [Product] = [
        Product(productImageName: "chair", productTitle: "simple chair", productPrice: 50000, check: false),
        Product(productImageName: "chair2", productTitle: "vivid chair", productPrice: 40000, check: false),
        Product(productImageName: "cup", productTitle: "cup", productPrice: 2000, check: false),
        Product(productImageName: "furniture", productTitle: "furniture", productPrice: 2000, check: false),
        Product(productImageName: "sofa", productTitle: "sofa", productPrice: 200000, check: false),
        Product(productImageName: "table", productTitle: "table", productPrice: 120000, check: false)
    ]
    
    static var categoryProducts: [[Product]] = [
        foodProducts + beautyProducts + digitalProducts + furnitureProducts,
        beautyProducts,
        digitalProducts,
        foodProducts,
        furnitureProducts
    ]

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
