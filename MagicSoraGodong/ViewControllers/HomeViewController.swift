//
//  ViewController.swift
//  MagicSoraGodong
//
//  Created by uno on 2020/10/18.
//

import UIKit

class HomeViewController: UIViewController,
                          UITableViewDataSource,
                          UITableViewDelegate{
    
    
    @IBOutlet weak var scrollView:UIScrollView!
    let category = ["의류","패션","인테리어","가전"]
    var categoryMenus:[UILabel] = []
    
    
    
    //MARK: TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell:HomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.cellIdentifier) as? HomeTableViewCell else {fatalError("Unable to dequeue HomeTableViewCell")}
        return cell
    }
     
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
}

//MARK: UI
extension HomeViewController{
    
    func initUI(){
        makeCategoryMenu()
        
    }
    
    func makeCategoryMenu(){
        //상단 메뉴 생성
        for i in 0..<category.count{
            let categoryMenu = UILabel()
            let xposion = (self.view.frame.width/5)*CGFloat(i)
            categoryMenu.text = category[i]
            categoryMenu.frame = CGRect(x: xposion+30, y: 15, width:30 , height: 30)
            categoryMenu.tag = i
            categoryMenu.sizeToFit()
            categoryMenu.isUserInteractionEnabled = true
            
            categoryMenu.textColor = i == 0 ? #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1) :  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
            let categoryTab:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.touchUpCategory(_:)))
            categoryMenu.addGestureRecognizer(categoryTab)
            categoryMenus.append(categoryMenu)
            scrollView.contentSize.width = self.view.frame.width*1.5
            scrollView.addSubview(categoryMenu)
        }
    }
    
    //카테고리 클릭했을때 처리
    @objc func touchUpCategory(_ sender:UIGestureRecognizer){
        guard let tabGesture = sender as? UITapGestureRecognizer else {return}
        guard let selected = tabGesture.view as? UILabel else {return}
         
        for i in 0..<categoryMenus.count{
            categoryMenus[i].textColor = categoryMenus[i].tag == selected.tag ? #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1) :  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
        
    }
    
   
    
    
   
}
 
