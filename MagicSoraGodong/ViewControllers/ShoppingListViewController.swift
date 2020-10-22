//
//  ShoppingListViewController.swift
//  MagicSoraGodong
//
//  Created by hiju on 2020/10/21.
//

import UIKit

struct Cart {
    let itemTitle: String?
    let itemSellerNameLabel: String?
    let itemPrice: Int?
    let itemAmount: Int?
    
    init(itemTitle: String, itemSellerNameLabel: String, itemPrice: Int, itemAmount: Int) {
        
        self.itemTitle = itemTitle
        self.itemSellerNameLabel = itemSellerNameLabel
        self.itemPrice = itemPrice
        self.itemAmount = itemAmount

    }
    
    var fullPrice: String {
        let full = (itemPrice ?? 0) * (itemAmount ?? 0)
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let result = numberFormatter.string(from: NSNumber(value: full))!
        return result
    }
    
}

class ShoppingListViewController: UIViewController {

    //MARK: Properties
    
    @IBOutlet weak var cartTableView: UITableView!
    private var cart: [Cart] = [Cart(itemTitle: "woody table", itemSellerNameLabel: "forestman", itemPrice: 10000, itemAmount: 1), Cart(itemTitle: "engle chair", itemSellerNameLabel: "pointmachine", itemPrice: 20000, itemAmount: 2), Cart(itemTitle: "midnight rip", itemSellerNameLabel: "imsopretty", itemPrice: 7000, itemAmount: 1)]
    
    //MARK: Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

}


//MARK: TableView

//extension ShoppingListViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return cart.count + 1
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//    
//    
//}
//
//extension ShoppingListViewController: UITableViewDelegate {
//    
//}

