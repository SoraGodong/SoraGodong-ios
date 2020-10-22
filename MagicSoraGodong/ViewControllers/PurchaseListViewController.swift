//
//  PurchaseListViewController.swift
//  MagicSoraGodong
//
//  Created by hiju on 2020/10/22.
//

import UIKit


struct Purchase {
    let itemPurchaseDate: String?
    let itemImageName: String?
    let itemTitle: String?
    let itemSellerNameLabel: String?
    let itemPrice: Int?
    var itemAmount: Int?
    
    init(itemPurchaseDate: String, itemImageName: String, itemTitle: String, itemSellerNameLabel: String, itemPrice: Int, itemAmount: Int) {
    
        self.itemPurchaseDate = itemPurchaseDate
        self.itemImageName = itemImageName
        self.itemTitle = itemTitle
        self.itemSellerNameLabel = itemSellerNameLabel
        self.itemPrice = itemPrice
        self.itemAmount = itemAmount

    }
    
    var fullPriceToInt: Int {
        return (itemPrice ?? 0) * (itemAmount ?? 0)
    }
    
    var fullPrice: String {
        let full = (itemPrice ?? 0) * (itemAmount ?? 0)
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let result = numberFormatter.string(from: NSNumber(value: full))!
        return result
    }
    
}



class PurchaseListViewController: UIViewController {

    //MARK: Properties
    
    @IBOutlet weak var purchaseListTableView: UITableView!
    
    private var purchase: [Purchase] = [
        Purchase(itemPurchaseDate: "", itemImageName: "", itemTitle: "", itemSellerNameLabel: "", itemPrice: 0, itemAmount: 0),
        Purchase(itemPurchaseDate: "20200928. 16:24:20", itemImageName: "table", itemTitle: "woody table", itemSellerNameLabel: "lottefurniture", itemPrice: 10000, itemAmount: 1),
        Purchase(itemPurchaseDate: "20201001. 10:40:19", itemImageName: "chair", itemTitle: "engle chair", itemSellerNameLabel: "lottefurniture", itemPrice: 20000, itemAmount: 2),
        Purchase(itemPurchaseDate: "20201002. 18:28:10", itemImageName: "cup", itemTitle: "white cup", itemSellerNameLabel: "lotteMart", itemPrice: 7000, itemAmount: 7)
    ]
    
    //MARK: Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        purchaseListTableView.dataSource = self
        purchaseListTableView.delegate = self
        purchaseListTableView.tableFooterView = UIView()
        //purchaseListTableView.separatorStyle = .none

    }
    
    


}


//MARK: - TableView

extension PurchaseListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return purchase.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PurchaseListHeaderTableViewCell", for: indexPath) as? PurchaseListHeaderTableViewCell else { return UITableViewCell() }
            cell.purchaseTotalItemsLabel.text = "total \(purchase.count - 1)"
            cell.selectionStyle = .none
            return cell
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PurchaseListTableViewCell", for: indexPath) as? PurchaseListTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.itemImageView.image = UIImage(named: purchase[indexPath.row].itemImageName ?? "")
        cell.itemNameLabel.text = String(purchase[indexPath.row].itemTitle ?? "")
        cell.itemPriceLabel.text = String(purchase[indexPath.row].fullPrice) + " | 수량 " + String(purchase[indexPath.row].itemAmount ?? 0)
        cell.itemPurchaseDateLabel.text = purchase[indexPath.row].itemPurchaseDate
        cell.itemsellerLabel.text = purchase[indexPath.row].itemSellerNameLabel
        return cell
        
    }
    
    
}


extension PurchaseListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 130
        }
        return 211
        
    }
    
}
