//
//  ViewController.swift
//  MagicSoraGodong
//
//  Created by uno on 2020/10/18.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var scrollView:UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let category = ["의류","패션","인테리어"]
        for i in 0..<category.count{
            let label = UILabel()
            label.text = category[i]
            let xposion = (self.view.frame.width/6)*CGFloat(i)
            label.frame = CGRect(x: xposion+15, y: 15, width:30 , height: 30)
            
            label.sizeToFit()
            if i==0{
                label.textColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            }
            scrollView.contentSize.width = self.view.frame.width*1.5
            scrollView.addSubview(label)
        } 
    }


}

 
 
