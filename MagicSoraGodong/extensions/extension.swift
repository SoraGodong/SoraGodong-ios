//
//  extension.swift
//  MagicSoraGodong
//
//  Created by 이정인 on 2020/10/20.
//

import UIKit

extension CALayer{
    func addBorder(_ arr_edge: [UIRectEdge] , color:UIColor, width:CGFloat){
        for edge in arr_edge{
            let border = CALayer()
                 switch edge {
                 case UIRectEdge.top:
                     border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: width)
                     break
                 case UIRectEdge.bottom:
                     border.frame = CGRect.init(x: 0, y: frame.height - width, width: frame.width, height: width)
                     break
                 case UIRectEdge.left:
                     border.frame = CGRect.init(x: 0, y: 0, width: width, height: frame.height)
                     break
                 case UIRectEdge.right:
                     border.frame = CGRect.init(x: frame.width - width, y: 0, width: width, height: frame.height)
                     break
                 default:
                     break
                 }
                 border.backgroundColor = color.cgColor;
            self.addSublayer(border)
        }
    }
}

extension UIImageView{
    func loadImage(url:String){
        DispatchQueue.global().async {
            guard let imageURL:URL = URL(string: url) else {return}
            guard let imageData: Data = try? Data(contentsOf: imageURL) else {
                return}
            DispatchQueue.main.async {
                    self.image = UIImage(data:imageData)
            }
        }
    }
    
    func loadImage(url:URL){
        DispatchQueue.global().async {
            let imageURL:URL = url 
            guard let imageData: Data = try? Data(contentsOf: imageURL) else {
                return}
            DispatchQueue.main.async {
                    self.image = UIImage(data:imageData)
            }
        }
    }
}
