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
        let category = ["의류","뷰티","식품","인테리어"]
        for i in 0..<category.count{
            let label:UILabel = UILabel()
            label.text = category[i]
            let xposition = self.view.frame.width*CGFloat(i)
            label.frame = CGRect(x: xposition, y: 0, width: 30, height: 30)
            scrollView.contentSize.width = self.view.frame.width*1.5
            scrollView.addSubview(label)
        }
        // Do any additional setup after loading the view.
    }


}

