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
    
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCollectionView()
    }
    
}
// MARK:- Configure UI
extension StudioViewController {
    
    func setCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            UINib(nibName: "StudioCollectionViewCell", bundle: nil),
            forCellWithReuseIdentifier: "studioCell")
    }
    
}

// MARK:- Methods
extension StudioViewController {
    
}

// MARK:- Collection View DataSource
extension StudioViewController: UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "studioCell",
                for: indexPath) as? StudioCollectionViewCell else { return UICollectionViewCell() }
        
        cell.productNameLabel.text = "데리버거"
        cell.productPriceLabel.text = "\(2000)원"
        
        return cell
    }
    
}

// MARK:- Collection View Delegate
extension StudioViewController: UICollectionViewDelegate {
    
    
    
}

// MARK:- Collection View Delegate FlowLayout
extension StudioViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - 30) / 2
        return CGSize(width: width, height: width + 80)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top:10,left: 10,bottom: 10,right: 10)
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
}
