//
//  ProductInformationViewController.swift
//  MagicSoraGodong
//
//  Created by uno on 2020/10/21.
//

import UIKit

class ProductInformationViewController: UIViewController {
    
    // MARK:- Properties
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    var temporaryProductImageName: String?
    var temporaryProductName: String?
    var temporaryProductPrice: Int?
    
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }

}

// MARK:- Configure UI
extension ProductInformationViewController {
    
    func configureUI() {
        productImage.image = UIImage(named: temporaryProductImageName ?? "")
        productName.text = temporaryProductName
        productPrice.text = String(temporaryProductPrice ?? 0) + " 원"
    }
    
}
