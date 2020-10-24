//
//  ShoppingListViewController.swift
//  MagicSoraGodong
//
//  Created by hiju on 2020/10/21.
//

import UIKit

struct Cart {
    let itemImageName: String?
    let itemTitle: String?
    let itemSellerNameLabel: String?
    let itemPrice: Int?
    var itemAmount: Int?
    var isCheck: Bool?
    
    init(itemImageName: String, itemTitle: String, itemSellerNameLabel: String, itemPrice: Int, itemAmount: Int, isCheck: Bool) {
    
        self.itemImageName = itemImageName
        self.itemTitle = itemTitle
        self.itemSellerNameLabel = itemSellerNameLabel
        self.itemPrice = itemPrice
        self.itemAmount = itemAmount
        self.isCheck = isCheck

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

class ShoppingListViewController: UIViewController {

    //MARK: Properties
    
    @IBOutlet weak var cartTableView: UITableView!
    
    private var totalPrice = 0
    private var cart: [Cart] = [
        Cart(itemImageName: "table", itemTitle: "woody table", itemSellerNameLabel: "lottefurniture", itemPrice: 10000, itemAmount: 1, isCheck: true),
        Cart(itemImageName: "chair", itemTitle: "engle chair", itemSellerNameLabel: "lottefurniture", itemPrice: 20000, itemAmount: 2, isCheck: true),
        Cart(itemImageName: "cup", itemTitle: "white cup", itemSellerNameLabel: "lotteMart", itemPrice: 7000, itemAmount: 1, isCheck: true),
        Cart(itemImageName: "sofa", itemTitle: "녹색 자연의 소파", itemSellerNameLabel: "lottefurniture", itemPrice: 5430000, itemAmount: 1, isCheck: true)
    ]
    
    //MARK: Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //cartTableView.separatorStyle = .none
        cartTableView.register(ShoppingListHeaderView.self, forHeaderFooterViewReuseIdentifier: "header")
        checkTotalPrice()
        
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationItem.title = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cartTableView.dataSource = self
        cartTableView.delegate = self
        cartTableView.reloadData()
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationItem.title = ""
    }

}


//MARK: - Action Event

extension ShoppingListViewController {
    
    @objc func clickOnPlusButton(_ sender: UIButton) {
        guard let cell = cartTableView.cellForRow(at: [0, sender.tag]) as? ShoppingListTableViewCell else { return }
        cart[sender.tag].itemAmount! += 1
        cell.amountLabel.text = String(cart[sender.tag].itemAmount ?? -1)
        cell.priceLabel.text = cart[sender.tag].fullPrice
        if cart[sender.tag].isCheck ?? false {
            totalPrice += cart[sender.tag].itemPrice ?? 0
            cartTableView.reloadData()
        }
    }
    
    @objc func clickOnMinusButton(_ sender: UIButton) {
        guard let cell = cartTableView.cellForRow(at: [0, sender.tag]) as? ShoppingListTableViewCell else { return }
        if cart[sender.tag].itemAmount == 1 {
            return
        }
        cart[sender.tag].itemAmount! -= 1
        cell.amountLabel.text = String(cart[sender.tag].itemAmount ?? -1)
        cell.priceLabel.text = cart[sender.tag].fullPrice
        if cart[sender.tag].isCheck ?? false {
            totalPrice -= cart[sender.tag].itemPrice ?? 0
            cartTableView.reloadData()
        }
    }
    
    @objc func clickOnSelectButton(_ sender: UIButton) {
        if cart[sender.tag].isCheck ?? false {
            cart[sender.tag].isCheck = false
            sender.tintColor = #colorLiteral(red: 0.7900478244, green: 0.7798151374, blue: 0.7973746657, alpha: 1)
            totalPrice -= (cart[sender.tag].itemAmount ?? 0) * (cart[sender.tag].itemPrice ?? 0)
            cartTableView.reloadData()
        }
        else {
            cart[sender.tag].isCheck = true
            sender.tintColor = #colorLiteral(red: 0.5169164538, green: 0.689781487, blue: 0.9588938355, alpha: 1)
            totalPrice += (cart[sender.tag].itemAmount ?? 0) * (cart[sender.tag].itemPrice ?? 0)
            cartTableView.reloadData()
        }
    }
    
    func checkTotalPrice() {
        for items in cart {
            if items.isCheck ?? false {
            totalPrice += (items.itemAmount ?? 0) * (items.itemPrice ?? 0)
            }
        }
    }
    
}

//MARK: - TableView

extension ShoppingListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cart.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == cart.count {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingListfooterView", for: indexPath) as? ShoppingListfooterView else { return UITableViewCell() }
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            let result = numberFormatter.string(from: NSNumber(value: totalPrice))!
            cell.totalPrice.text = result
            cell.purchaseButton.backgroundColor = #colorLiteral(red: 0.5169164538, green: 0.689781487, blue: 0.9588938355, alpha: 1)
            cell.purchaseButton.layer.cornerRadius = 5
            cell.purchaseButton.setTitleColor(.white, for: .normal)
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingListTableViewCell", for: indexPath) as? ShoppingListTableViewCell else { return UITableViewCell() }
        
        cell.selectionStyle = .none
        
        cell.minusAmountButton.tag = indexPath.row
        cell.plusAmountButton.tag = indexPath.row
        cell.checkSelectButton.tag = indexPath.row
        
        cell.itemTitleLabel.text = cart[indexPath.row].itemTitle
        cell.sellerLabel.text = cart[indexPath.row].itemSellerNameLabel
        cell.priceLabel.text = cart[indexPath.row].fullPrice
        cell.amountLabel.text = String(cart[indexPath.row].itemAmount ?? -1)
        
        DispatchQueue.main.async {
            cell.itemImageView.image = UIImage(named: self.cart[indexPath.row].itemImageName ?? "")
        }
        
        cell.plusAmountButton.addTarget(self, action: #selector(clickOnPlusButton(_:)), for: .touchUpInside)
        cell.minusAmountButton.addTarget(self, action: #selector(clickOnMinusButton(_:)), for: .touchUpInside)
        cell.checkSelectButton.addTarget(self, action: #selector(clickOnSelectButton(_:)), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let headerview = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header")
            as? ShoppingListHeaderView else {
            print("error")
                return UIView()
        }
        let backgroundView: UIView = {
            let view = UIView()
            view.backgroundColor = .white
            return view
        }()
        headerview.backgroundView = backgroundView
        headerview.totalItemsAmountLabel.text = "total \(cart.count)"
        return headerview
    }
    
}

extension ShoppingListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == cart.count {
            return 200
        }
        return 177
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 110
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let sectionHeaderHeight = CGFloat(110)
        
        if scrollView.contentOffset.y <= sectionHeaderHeight, scrollView.contentOffset.y >= 0 {
            
            scrollView.contentInset = UIEdgeInsets.init(top: -scrollView.contentOffset.y, left: 0, bottom: 0, right: 0)
            
        } else if scrollView.contentOffset.y >= sectionHeaderHeight {
            
            scrollView.contentInset = UIEdgeInsets.init(top: -sectionHeaderHeight, left: 0, bottom: 0, right: 0)
        }
    }
}

