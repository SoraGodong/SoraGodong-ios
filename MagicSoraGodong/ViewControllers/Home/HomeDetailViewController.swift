//
//  HomeDetailViewController.swift
//  MagicSoraGodong
//
//  Created by 이정인 on 2020/10/20.
//

import UIKit
import AVKit
import AVFoundation

class HomeDetailViewController: UIViewController{
   
    
    // MARK:- Properties
    var video:Video?
    var comments:[Comment] = Comment.initData()
    var isBack:Bool = false
    
    @IBOutlet weak var videoContainer:UIView!
    @IBOutlet weak var profile:UIImageView!
    @IBOutlet weak var Videotitle:UILabel!
    @IBOutlet weak var hostName:UILabel!
    @IBOutlet weak var commentTable:UITableView!
    @IBOutlet weak var subscriptButton :UIButton!
    @IBOutlet weak var cartButton:UIButton!
    @IBOutlet weak var titleBar:UIStackView!
    @IBOutlet weak var commentWrite:UITextField!
     
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        videoAdd()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
//        print(self.isBack)
//        if self.isBack{
//            let sVC = ShoppingListViewController()
//            self.present(sVC, animated: true, completion: nil)
//        }
    }
}

// MARK: - Configure
extension HomeDetailViewController{
    func initUI(){
        cartButton.layer.cornerRadius = 0.5 * cartButton.bounds.size.width
        cartButton.layer.shadowColor = UIColor.gray.cgColor
        cartButton.layer.shadowOpacity = 1.0
        cartButton.layer.shadowOffset = .zero
        cartButton.layer.shadowRadius = 6
        
        self.view.bringSubviewToFront(cartButton)
        self.commentWrite.delegate = self
        
    }
    
    func videoAdd(){
        guard let v = self.video else {return}
        self.Videotitle.text = v.title
        self.hostName.text = v.subtitle
        guard let videoUrl = video?.url else {return}
        let player = AVPlayer(url: videoUrl)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = .resize
        videoContainer.layer.addSublayer(playerLayer)
        playerLayer.frame = videoContainer.bounds
        player.play()
    }
}

//MARK: - TableView
extension HomeDetailViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell:CommentTableViewCell = tableView.dequeueReusableCell(withIdentifier: CommentTableViewCell.cellIdentifier) as? CommentTableViewCell else {fatalError("Unable to dequeue CommentTableViewCell")}
        let comment = comments[indexPath.row]
        cell.userId.text = comment.userId
        cell.date.text = comment.date
        cell.comment.text = comment.content
        return cell
    }
    
}

//MARK: - textField
extension HomeDetailViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        if self.commentWrite.text == ""{
            Toast.show(message: "댓글을 입력해주세요", controller: self)
            return false
        }else{
            comments.append(Comment(id: "lotteWorld", content: commentWrite.text ?? "", date: "방금"))
            self.commentWrite.text = ""
            comments.reverse()
            commentTable.reloadData()
            return true
        }
    }
}


//MARK: - method
extension HomeDetailViewController{
    
    @IBAction func showItemList(_ sender:UIButton){
        self.definesPresentationContext = true
        //Singletone.shared.selVideoId = video?.videoId ?? "0"
        let sb: UIStoryboard = UIStoryboard(name: "MyPage", bundle: nil)
        guard let ShoppingVC = sb.instantiateViewController(withIdentifier: "ShoppingListViewController") as? ShoppingListViewController else {return}
        ShoppingVC.modalPresentationStyle = .formSheet
        self.present(ShoppingVC, animated: true, completion: nil)
      
    }
    @IBAction func TouchUpSubscript(_ sender:UIButton){
        let status = self.subscriptButton.currentTitle
        if status == "구독하기"{
            Toast.show(message: "구독 설정되었습니다.", controller: self)
            self.subscriptButton.setTitle("구독 중", for: .normal)
        }else{
            Toast.show(message: "구독 취소되었습니다.", controller: self)
            self.subscriptButton.setTitle("구독하기", for: .normal)
            
        }
    }
}
 
