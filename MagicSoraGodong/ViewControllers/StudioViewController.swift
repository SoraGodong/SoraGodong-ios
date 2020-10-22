//
//  StudioViewController.swift
//  MagicSoraGodong
//
//  Created by uno on 2020/10/20.
//

import UIKit

// MARK:- Struct
struct Product {
    let productImageName: String?
    let productTitle: String?
    let productPrice: Int?
    var isCheck: Bool?
    
    init(productImageName: String, productTitle: String, productPrice: Int, isCheck: Bool) {
        self.productImageName = productImageName
        self.productTitle = productTitle
        self.productPrice = productPrice
        self.isCheck = isCheck
    }
}

// MARK:- View Controller
class StudioViewController: UIViewController {
    
    // MARK:- Properties
    @IBOutlet weak var collectionView: UICollectionView!
    private var products: [Product] = [
        Product(productImageName: "table", productTitle: "woody table", productPrice: 10000, isCheck: true),
        Product(productImageName: "chair", productTitle: "engle chair", productPrice: 20000, isCheck: true),
        Product(productImageName: "cup", productTitle: "white cup", productPrice: 7000, isCheck: true),
        Product(productImageName: "sofa", productTitle: "녹색 자연의 소파", productPrice: 5430000, isCheck: true)
    ]
    var productNames = ["데리버거", "새우버거", "게살버거", "한우버거", "와퍼", "주니어와퍼", "빅맥", "상하이스파이스"]
    
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        configureNavigationBar()
    }
    
}
// MARK:- Configure UI
extension StudioViewController {
    
    func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            UINib(nibName: "StudioCollectionViewCell", bundle: nil),
            forCellWithReuseIdentifier: "studioCell")
        
        collectionView.register(UINib(nibName: String(describing: StudioCollectionHeaderReusableView.self), bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: String(describing: StudioCollectionHeaderReusableView.self))
    }
    
    func configureNavigationBar() {
        let button = UIBarButtonItem(title: "선택완료", style: .plain, target: self, action: #selector(touchUpNextButton))
        navigationItem.rightBarButtonItem = button
        navigationItem.title = "마법의 소라고동"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = .systemIndigo
        navigationController?.navigationBar.tintColor = .white
    }
    
}

// MARK:- Methods
extension StudioViewController {
    
//    @objc func clickOnSelectButton(_ sender: UIButton) {
//        if cart[sender.tag].isCheck ?? false {
//            cart[sender.tag].isCheck = false
//            sender.tintColor = #colorLiteral(red: 0.7900478244, green: 0.7798151374, blue: 0.7973746657, alpha: 1)
//            totalPrice -= (cart[sender.tag].itemAmount ?? 0) * (cart[sender.tag].itemPrice ?? 0)
//            cartTableView.reloadData()
//        }
//        else {
//            cart[sender.tag].isCheck = true
//            sender.tintColor = #colorLiteral(red: 0.5169164538, green: 0.689781487, blue: 0.9588938355, alpha: 1)
//            totalPrice += (cart[sender.tag].itemAmount ?? 0) * (cart[sender.tag].itemPrice ?? 0)
//            cartTableView.reloadData()
//        }
//    }
    
    @objc func touchUpNextButton() {
        // 상품 체크해야 넘어가도록 조건 추가하기
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "registrationViewController") as? RegistrationViewController else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

// MARK:- Collection View DataSource
extension StudioViewController: UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "studioCell",
                for: indexPath) as? StudioCollectionViewCell else { return UICollectionViewCell() }
        

        cell.productImage.image = UIImage(named: self.products[indexPath.item].productImageName ?? "")
        cell.checkBoxButton.tag = indexPath.item
        cell.productNameLabel.text = products[indexPath.item].productTitle
        cell.productPriceLabel.text = String(products[indexPath.item].productPrice ?? 0)
//        cell.checkBoxButton.isSelected.toggle()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: String(describing: StudioCollectionHeaderReusableView.self), for: indexPath)
            return header
        default:
            return UICollectionReusableView()
        }
    }
    
}

// MARK:- Collection View Delegate
extension StudioViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "productInformationViewController") as? ProductInformationViewController else {
            return
        }
        
        present(vc, animated: true, completion: nil)
    }
}

// MARK:- Collection View Delegate FlowLayout
extension StudioViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - 30) / 2
        return CGSize(width: width, height: width + 80)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top:10, left: 10, bottom: 10, right: 10)
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 400, height: 50)
    }
    
}
