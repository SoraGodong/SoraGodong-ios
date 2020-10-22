//
//  RegistrationViewController.swift
//  MagicSoraGodong
//
//  Created by uno on 2020/10/21.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    // MARK:- Properties
    @IBOutlet weak var tableView: UITableView!
    var numberOfProducts = 3
    
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        configureNavigationBar()
        configureTapGesture()
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
    }
    
    func configureNavigationBar() {
        let registrationButton = UIBarButtonItem(title: "등록", style: .plain, target: self, action: #selector(touchUpRegistrationButton))
        let cancelButton = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(touchUpCancelButton))
        navigationItem.leftBarButtonItem = cancelButton
        navigationItem.rightBarButtonItem = registrationButton
        navigationItem.title = "마법의 소라고동"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = .systemIndigo
        navigationController?.navigationBar.tintColor = .white
    }
    
    func configureTapGesture() {
        let viewTapGestureRecognizer = UITapGestureRecognizer()
        self.view.addGestureRecognizer(viewTapGestureRecognizer)
        viewTapGestureRecognizer.addTarget(self, action: #selector(tapView))
    }
    
    func configureTextView() {
//        let videoInformationCell = VideoInformationTableViewCell()
//        let textView = videoInformationCell.textView!
//        textView.text = "한줄평을 작성해주세요."
//        textView.textColor = UIColor.lightGray
    }
    
}

// MARK:- Methods
extension RegistrationViewController {
    
    @objc func touchUpCancelButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func touchUpRegistrationButton() {
        let alert = UIAlertController(
            title: "",
            message: "브이로그 등록이 완료되었습니다.",
            preferredStyle: .alert)
        let okAction = UIAlertAction(
            title: "확인",
            style: .default) { (action : UIAlertAction) in
            // 등록 완료 조건 추가하기
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(okAction) 
        present(alert, animated: true, completion: nil)
    }
    
    @objc func tapView() {
        view.endEditing(true)
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
            return numberOfProducts
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
            cell.selectionStyle = .none
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: String(describing: UploadingViedoTableViewCell.self),
                    for: indexPath) as? UploadingViedoTableViewCell else {
                return UITableViewCell()
            }
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
            return 100
        default:
            return UITableView.automaticDimension
        }
    }
}

extension RegistrationViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "영상 내용을 작성해주세요."
            textView.textColor = UIColor.lightGray
        }
    }
    
}