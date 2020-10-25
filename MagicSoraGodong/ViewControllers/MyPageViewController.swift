//
//  MyPageViewController.swift
//  MagicSoraGodong
//
//  Created by hiju on 2020/10/20.
//

import UIKit

class MyPageViewController: UIViewController {

    //MARK: Properties
    
    @IBOutlet weak var mypageTableView: UITableView!
    
    //MARK: Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mypageTableView.dataSource = self
        mypageTableView.delegate = self
        
        mypageTableView.separatorStyle = .none
        mypageTableView.tableFooterView = UIView()
        
        navigationController?.navigationBar.tintColor = .white
        self.navigationItem.title = "마이페이지"
        navigationController?.navigationBar.topItem?.title = "마이페이지"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "마이페이지"
        navigationController?.navigationBar.topItem?.title = "마이페이지"
    }

}


//MARK: - TableView

extension MyPageViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyInformationTableViewCell", for: indexPath) as? MyInformationTableViewCell else { return UITableViewCell() }
            cell.idLabel.text = "lotteWorld"
            cell.emailLabel.text = "lotte@lotteWorld.co.kr"
            cell.selectionStyle = .none
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath) as? ShoppingTableViewCell else { return UITableViewCell() }
            cell.shoppingCartLabel.text = "total 4"
            cell.shoppingTotalListLabel.text = "total 3"
            cell.selectionStyle = .none
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShowHostTableViewCell", for: indexPath) as? ShowHostTableViewCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    
    
}

extension MyPageViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return 290
        case 1:
            return 220
        case 2:
            return 152
        default:
            return 0
        }
        
    }
    
}
