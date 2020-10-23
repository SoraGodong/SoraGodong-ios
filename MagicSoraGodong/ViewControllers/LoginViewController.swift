//
//  LoginViewController.swift
//  MagicSoraGodong
//
//  Created by hiju on 2020/10/23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var naverButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        naverButton.layer.cornerRadius = 5
        naverButton.layer.borderWidth = 1
        naverButton.layer.borderColor = #colorLiteral(red: 0, green: 0.6639735699, blue: 0, alpha: 1)
        submitButton.layer.cornerRadius = 5
    }

}
