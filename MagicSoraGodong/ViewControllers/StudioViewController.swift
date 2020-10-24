//
//  StudioViewController.swift
//  MagicSoraGodong
//
//  Created by uno on 2020/10/20.
//

import UIKit

class StudioViewController: UIViewController {
    
    // MARK:- Properties
    @IBOutlet weak var collectionView: UICollectionView!
//    private var collectionViewHeader = StudioCollectionHeaderReusableView()
    private var products = StudioProduct.categoryProducts[0]
//    private var categoryProducts = StudioProduct.categoryProducts
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        configureAlert()
        configureCollectionView()
        configureNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        reconfigureCollectionView()
    }
        
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
}
// MARK:- Configure UI
extension StudioViewController {
    
    func configureAlert() {
        let alert = UIAlertController(
            title: "쇼호스트",
            message: "홍보할 상품을 선택하고 영상을 업로드해주세요.",
            preferredStyle: .alert)
        let okAction = UIAlertAction(
            title: "확인",
            style: .default)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func configureCollectionView() {
//        collectionViewHeader.collectionView = self.collectionView
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            UINib(nibName: "StudioCollectionViewCell", bundle: nil),
            forCellWithReuseIdentifier: "studioCell")
        
        collectionView.register(UINib(nibName: String(describing: StudioCollectionHeaderReusableView.self), bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: String(describing: StudioCollectionHeaderReusableView.self))
        
//        guard let headerCell = collectionView.cellForItem(at: [0, 0]) as? StudioCollectionHeaderReusableView else { return }
//        headerCell.completionHandler = setProducts(_:)
    }
    
    func configureNavigationBar() {
        let button = UIBarButtonItem(title: "선택완료", style: .plain, target: self, action: #selector(touchUpNextButton))
        navigationItem.rightBarButtonItem = button
        navigationItem.title = "마법의 소라고동"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.5169164538, green: 0.689781487, blue: 0.9588938355, alpha: 1)
        navigationController?.navigationBar.tintColor = .white
    }
    
    func reconfigureCollectionView() {
        for index in 0 ..< products.count {
            if products[index].check == true {
                products[index].check = false
            }
        }
        SelectedProduct.shared.products = []
        collectionView.reloadData()
//        collectionView.reloadSections(IndexSet(0…0))
    }
    
}

// MARK:- Methods
extension StudioViewController {
    
    @objc func touchUpCheckBox(_ sender: UIButton) {
        guard let productCheck = products[sender.tag].check  else { return }
        if productCheck == true {
            products[sender.tag].check = false
            sender.tintColor = #colorLiteral(red: 0.7900478244, green: 0.7798151374, blue: 0.7973746657, alpha: 1)
            print("--------------------------------")
            print("취소 실행전 담긴 갯수: \(SelectedProduct.shared.products.count)")
            print("취소 실행전 태그 번호 : \(sender.tag)")
            print("--------------------------------")
            for index in 0 ..< SelectedProduct.shared.products.count {
                if SelectedProduct.shared.products[index].tagNumber == sender.tag {
                    SelectedProduct.shared.products.remove(at: index)
                    return
                }
            }
            print("--------------------------------")
            print("취소 실행후 담긴 갯수: \(SelectedProduct.shared.products.count)")
            print("취소 실행후 태그 번호 : \(sender.tag)")
            print("--------------------------------")
        }
        else if productCheck == false  {
            products[sender.tag].check = true
            sender.tintColor = #colorLiteral(red: 0.5169164538, green: 0.689781487, blue: 0.9588938355, alpha: 1)
            print("--------------------------------")
            print("추가 실행전 담긴 갯수: \(SelectedProduct.shared.products.count)")
            print("추가 실행전 태그 번호 : \(sender.tag)")
            print("--------------------------------")
            SelectedProduct.shared.products.append(
                SelectedProduct.Product(
                    tagNumber: sender.tag,
                    productImageName: products[sender.tag].productImageName,
                    productTitle: products[sender.tag].productTitle,
                    productPrice: products[sender.tag].productPrice)
            )
            print("--------------------------------")
            print("추가 실행후 단긴 갯수: \(SelectedProduct.shared.products.count)")
            print("추가 실행후 태그 번호 : \(sender.tag)")
            print("--------------------------------")
        }
    }
    
    @objc func touchUpNextButton() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "registrationViewController") as? RegistrationViewController else {
            return
        }
        
        if SelectedProduct.shared.products.count == 0 {
            let alert = UIAlertController(
                title: "",
                message: "제품을 최소 1개 이상 선택해주세요.",
                preferredStyle: .alert)
            let okAction = UIAlertAction(
                title: "확인",
                style: .default) { (action : UIAlertAction) in
            }
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        } else {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func setProducts(_ index: Int) {
        products = StudioProduct.categoryProducts[index]
        print(products.count)
        collectionView.reloadData()
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
        
        cell.productImage.image = UIImage(
            named: self.products[indexPath.item].productImageName ?? "")
        cell.checkBoxButton.tag = indexPath.item
        cell.checkBoxButton.tintColor = #colorLiteral(red: 0.7900478244, green: 0.7798151374, blue: 0.7973746657, alpha: 1)
        cell.checkBoxButton.addTarget(self, action: #selector(touchUpCheckBox(_:)), for: .touchUpInside)
        cell.productNameLabel.text = products[indexPath.item].productTitle
        cell.productPriceLabel.text = numberFormatter.string(from: NSNumber(value: products[indexPath.item].productPrice ?? 0))! + " 원"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: String(describing: StudioCollectionHeaderReusableView.self), for: indexPath) as? StudioCollectionHeaderReusableView else { return UICollectionReusableView() }
            header.completionHandler = setProducts(_:)
            return header
        default:
            return UICollectionReusableView()
        }
    }
    
}

// MARK:- Collection View Delegate
extension StudioViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let productInformationController = storyboard?.instantiateViewController(withIdentifier: "productInformationViewController") as? ProductInformationViewController else {
            return
        }
        
        productInformationController.temporaryProductImageName = products[indexPath.item].productImageName
        productInformationController.temporaryProductName = products[indexPath.item].productTitle
        productInformationController.temporaryProductPrice = products[indexPath.item].productPrice
        
        present(productInformationController, animated: true, completion: nil)
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
