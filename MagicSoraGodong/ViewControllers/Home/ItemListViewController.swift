//
//  ItemListViewController.swift
//  MagicSoraGodong
//
//  Created by 이정인 on 2020/10/21.
//

import UIKit

class ItemListViewController: UIViewController{
    
    // MARK:- Properties
    @IBOutlet weak var tableView:UITableView!
    var items:[UILabel] = []
    var itemList:[Item] = []
    
    // MARK:- life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        itemList = Item.initData(id: Singletone.shared.selVideoId ?? "1")
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        tableView.reloadData()
    }

}


// MARK:- method
extension ItemListViewController{
    func checkItem()->Bool{
        var checked = 0
       
        for i in items{
            if i.text == "0"{
                checked+=1
            }
        }
        if checked == items.count{
            return false
        }
        return true
    }
    
    @IBAction func cartButton(_ sender:UIButton){
        if !self.checkItem() {
            Toast.show(message: "아이템을 선택해주세요", controller: self)
            return
        }
        
        let alert = UIAlertController(title: "장바구니", message: "장바구니에 담겼습니다.", preferredStyle: .alert)
        
        let goToCart = UIAlertAction(title: "장바구니 보기", style: .default, handler:{
            (action:UIAlertAction) in
            //장바구니 이동 
            //장바구니 담기
           
            //self.dismiss(animated: true , completion: nil)
            guard let pvc = self.presentingViewController else {return}
            self.dismiss(animated: true){
                
                guard let shoppingVC = self.storyboard?.instantiateViewController(withIdentifier: "itemListView") as? ShoppingListViewController else {return}
                pvc.modalPresentationStyle = .fullScreen
                self.present(shoppingVC, animated: true, completion: nil)
            }
        })
        let close = UIAlertAction(title: "닫기", style: .cancel, handler: {
            (action:UIAlertAction) in
            self.dismiss(animated: true, completion: nil)
        })
        
        alert.addAction(goToCart)
        alert.addAction(close)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func buyButton(_ sender:UIButton){
        if !self.checkItem() {
            Toast.show(message: "아이템을 선택해주세요", controller: self)
            return
        }else{
            //구매 페이지 이동
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}

//MARK: - Table
extension ItemListViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell:ItemTableViewCell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.cellIdentifier) as? ItemTableViewCell else {fatalError("Unable to dequeue CommentTableViewCell")}
        items.append(cell.itemCnt)
        let item = itemList[indexPath.row]
        cell.itemTitle.text = item.itemTitle
        cell.itemPrice.text = item.itemPrice
        return cell
    }
}
