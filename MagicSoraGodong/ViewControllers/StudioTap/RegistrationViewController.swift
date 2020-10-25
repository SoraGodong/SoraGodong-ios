//
//  RegistrationViewController.swift
//  MagicSoraGodong
//
//  Created by uno on 2020/10/21.
//

import UIKit
import Photos

class RegistrationViewController: UIViewController {
    
    // MARK:- Properties
    @IBOutlet weak var tableView: UITableView!
    var numberOfProducts = 3
    private var selectedProducts = SelectedProduct.shared.products
    let mediaPickerManager = MediaPickerManager()
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        configureNavigationBar()
        configureTapGesture()
        mediaPickerManager.mediaPickerDelegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
}

// MARK:- Configure
extension RegistrationViewController {
    
    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(
            UINib(nibName: String(describing: SelectedProductTableViewCell.self), bundle: nil),
            forCellReuseIdentifier: String(describing: SelectedProductTableViewCell.self)
        )
        tableView.register(
            UINib(nibName: String(describing: UploadingViedoTableViewCell.self), bundle: nil),
            forCellReuseIdentifier: String(describing: UploadingViedoTableViewCell.self)
        )
        tableView.register(
            UINib(nibName: String(describing: VideoInformationTableViewCell.self), bundle: nil),
            forCellReuseIdentifier: String(describing: VideoInformationTableViewCell.self)
        )
        tableView.register(
            UINib(nibName: String(describing: ThumbnailTableViewCell.self), bundle: nil),
            forCellReuseIdentifier: String(describing: ThumbnailTableViewCell.self)
        )
    }
    
    func configureNavigationBar() {
        let registrationButton = UIBarButtonItem(title: "등록", style: .plain, target: self, action: #selector(touchUpRegistrationButton))
        let cancelButton = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(touchUpCancelButton))
        navigationItem.leftBarButtonItem = cancelButton
        navigationItem.rightBarButtonItem = registrationButton
        navigationItem.title = "마법의 소라고동"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.5169164538, green: 0.689781487, blue: 0.9588938355, alpha: 1)
        navigationController?.navigationBar.tintColor = .white
    }
    
    func configureTapGesture() {
        let viewTapGestureRecognizer = UITapGestureRecognizer()
        self.view.addGestureRecognizer(viewTapGestureRecognizer)
        viewTapGestureRecognizer.addTarget(self, action: #selector(tapView))
    }
    
}

// MARK:- Methods
extension RegistrationViewController {
    
    @objc func touchUpCancelButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func touchUpRegistrationButton() {
        if self.checkField() {
//            guard let homeViewController = storyboard?.instantiateViewController(withIdentifier: String(describing:HomeViewController.self)) as? HomeViewController else { return }
            guard let videoInfoCell = tableView.cellForRow(at: [2, 0]) as? VideoInformationTableViewCell else { return }
            VlogData.shared.videoTitle = videoInfoCell.videoTitleField.text
            VlogData.shared.vidoeContent = videoInfoCell.videoInfoField.text

            let alert = UIAlertController(
                title: "",
                message: "브이로그 등록이 완료되었습니다.",
                preferredStyle: .alert)
            let okAction = UIAlertAction(
                title: "확인",
                style: .default) { (action : UIAlertAction) in
                // 등록 완료 조건 추가하기
                self.navigationController?.popViewController(animated: true)
//                self.present(homeViewController, animated: true, completion: nil)
            }
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(
                title: "",
                message: "모든 항목을 작성해주세요.",
                preferredStyle: .alert)
            let okAction = UIAlertAction(
                title: "확인",
                style: .default)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    @objc func tapView() {
        view.endEditing(true)
    }
    
    func checkField() -> Bool {
        guard let pictureCell = tableView.cellForRow(at: [1, 0]) as? ThumbnailTableViewCell else { return false }
        guard let infoCell = tableView.cellForRow(at: [2, 0]) as? VideoInformationTableViewCell else { return false }
        
        guard let videoField = pictureCell.videoThumbnailImage else { return false }
        guard let titleField = infoCell.videoTitleField else { return false }
        guard let infonField = infoCell.videoInfoField else { return false }
        
        if !titleField.text!.isEmpty && infonField.text != "영상 내용을 작성해주세요." && infonField.text != "" && videoField.image !== nil {
            return true
        } else {
            return false
        }
    }
    @objc func keyboardWillShow(_ sender: Notification) {
        self.view.frame.origin.y = -220 // Move view 150 points upward
    }
    @objc func keyboardWillHide(_ sender: Notification) {
        self.view.frame.origin.y = 0 // Move view to original position
    }
    
}

// MARK:- Video Methods
extension RegistrationViewController {
    
    func checkPermissionAndPresentImagePicker() {
        print("영상업로드")
        PHPhotoLibrary.checkPermission { isSuccess in
            DispatchQueue.main.async {
                if isSuccess {
                    self.present(self.mediaPickerManager.imagePicker, animated: true, completion: nil)
                }
            }
        }
    }
    
    func imageUpload() {
        
    }
}

// MARK:- Media Picker Delegate
extension RegistrationViewController: MediaPickerDelegate {
    func didFinishPickingMedia(videoURL: URL) {
        let captureTime: [Double] = [12, 2, 3, 4]
        guard let mediaCell = tableView.cellForRow(at: [1, 0]) as? ThumbnailTableViewCell else { return }
        // images will be created at each capture times.
        mediaPickerManager.generateThumbnailSync(url: videoURL, startOffsets: captureTime) { images in
            mediaCell.videoThumbnailImage.image = images.first!
            VlogData.shared.videoAseet = AVAsset(url: videoURL)
            VlogData.shared.videoImage = images.first!
        }
    }
}

// MARK:- Table View DataSource
extension RegistrationViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return selectedProducts.count
        case 1, 2:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: String(describing: SelectedProductTableViewCell.self),
                    for: indexPath) as? SelectedProductTableViewCell else {
                return UITableViewCell()
            }
            
            
            cell.productImageView.image = UIImage(named: selectedProducts[indexPath.row].productImageName ?? "")
            cell.productName.text = selectedProducts[indexPath.row].productTitle
            cell.productPrice.text = numberFormatter.string(from: NSNumber(value: selectedProducts[indexPath.row].productPrice ?? 0))! + " 원"
            cell.selectionStyle = .none
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: String(describing: ThumbnailTableViewCell.self),
                    for: indexPath) as? ThumbnailTableViewCell else {
                return UITableViewCell()
            }
            cell.completionHandler = checkPermissionAndPresentImagePicker
            cell.selectionStyle = .none
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: String(describing: VideoInformationTableViewCell.self),
                    for: indexPath) as? VideoInformationTableViewCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "선택한 상품"
        case 1:
            return "브이로그 업로드"
        case 2:
            return "브이로그 정보"
        default:
            return ""
        }
    }
    
}

// MARK:- Table View Delegate
extension RegistrationViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let myLabel = UILabel()
        myLabel.frame = CGRect(x: 20, y: 8, width: 320, height: 15)
        myLabel.font = UIFont.systemFont(ofSize: 12)
        myLabel.text = self.tableView(tableView, titleForHeaderInSection: section)

        let headerView = UIView()
        headerView.backgroundColor = .systemGray6
        headerView.addSubview(myLabel)

        return headerView
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return UITableView.automaticDimension
        case 1:
            return UITableView.automaticDimension
        default:
            return UITableView.automaticDimension
        }
    }
}
