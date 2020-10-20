//
//  ViewController.swift
//  MagicSoraGodong
//
//  Created by uno on 2020/10/18.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var scrollView:UIScrollView!
    let category = ["의류","패션","인테리어","가전"]
    
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }


}

//MARK: UI
extension HomeViewController{
    func initUI(){
        //상단 메뉴 생성
        for i in 0..<category.count{
            let label = UILabel()
            let xposion = (self.view.frame.width/6)*CGFloat(i)
            
            label.text = category[i]
            label.frame = CGRect(x: xposion+15, y: 15, width:30 , height: 30)
            label.sizeToFit()
            
            scrollView.contentSize.width = self.view.frame.width*1.5
            scrollView.addSubview(label)
        }
    }
}
 
