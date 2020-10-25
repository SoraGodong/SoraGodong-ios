//
//  ViewController.swift
//  MagicSoraGodong
//
//  Created by uno on 2020/10/18.
//

import UIKit

class HomeViewController: UIViewController{

    // MARK:- Properties
    @IBOutlet weak var scrollView:UIScrollView!
    @IBOutlet weak var tableView:UITableView! 
    
    let category = categoty.categories
    var categoryMenus:[UILabel] = []
    var vlogs:[vlogItem] = []
    var videos:[Video] = Video.allVideos() 
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
        configureCategoryMenu()
        configureNotificationCenter()
        getVlogs()
//        print(Video.smapleVideos(0))
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("??")
        appendUploaded()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let homeDetailViewController:HomeDetailViewController = segue.destination as? HomeDetailViewController else {return}
        guard let selectedIndexPath = self.tableView.indexPathForSelectedRow else {return}
        homeDetailViewController.video = videos[selectedIndexPath.row]
        if selectedIndexPath.row < vlogs.count{
            homeDetailViewController.vlogIdx = vlogs[selectedIndexPath.row].vlogIdx
        }else{
            homeDetailViewController.vlogIdx = 1
        }
    }
}

// MARK:- Configure
extension HomeViewController{
    
    func configureNavigation(){
        var searchKeywordField:UITextField{
            let textfield = UITextField()
            textfield.frame = CGRect(x: 0, y: 0, width: self.view.frame.width/3, height: 50)
            textfield.placeholder = "검색어를 입력해주세요"
            textfield.attributedPlaceholder = NSAttributedString(string: "검색어를 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
            return textfield
        }
         
        self.navigationItem.titleView = searchKeywordField
        self.navigationItem.titleView?.isHidden = true
        self.tableView.separatorStyle = .none
    }
    func configureNotificationCenter(){
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.didReceiveVlogs),
                                               name: DidReceiveVlogsNotification, object: nil)
    }
    func configureCategoryMenu(){
        //상단 메뉴 생성
        
        for i in 0..<category.count{
            let categoryMenu = UILabel()
            let xposion = (self.view.frame.width/5)*CGFloat(i)
            categoryMenu.text = category[i]
            categoryMenu.frame = CGRect(x: xposion, y: 15, width:self.view.frame.width/5 , height: 30)
            categoryMenu.tag = i+1
            categoryMenu.textAlignment = .center
            categoryMenu.isUserInteractionEnabled = true
            categoryMenu.textColor = i == 0 ? #colorLiteral(red: 0.3134731054, green: 0.6144956946, blue: 1, alpha: 1) :  #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            
            
            let categoryTab:UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                            action: #selector(self.touchUpCategory(_:)))
            categoryMenu.addGestureRecognizer(categoryTab)
            categoryMenus.append(categoryMenu)
            scrollView.contentSize.width = self.view.frame.width*1.5
            scrollView.showsHorizontalScrollIndicator = false
            scrollView.addSubview(categoryMenu)
        }
    }
    
    func appendUploaded(){
        videos = Video.allVideos() 
        let uploaded = VlogData.shared
        guard let title = uploaded.videoTitle else {
            print("싱글톤 제목 없음")
            return
            
        }
        guard let subtitle = uploaded.vidoeContent else {
            print("싱글톤 아이템 없음")
            return
            
        }
        guard let VideoURL = uploaded.videoURL else {
            print("싱글톤 제목 없음")
            return
        }
        let thumbURLPath = Bundle.main.path(forResource: "foxVillage", ofType: "png")!
        let thumbURL = URL(fileURLWithPath: thumbURLPath)
        let remoteVideo = Video(url: VideoURL, thumbURL: thumbURL, title:title, subtitle:subtitle,id:"0")
        videos.append(remoteVideo)
        
        guard let tmp = videos.last else {return}
        for i in (0..<videos.count-1).reversed(){
            videos[i+1] = videos[i]
        }
        videos[0] = tmp
        tableView.reloadData()
        
    }
    //카테고리 클릭했을때 처리
       @objc func touchUpCategory(_ sender:UIGestureRecognizer){
           guard let tabGesture = sender as? UITapGestureRecognizer else {return}
           guard let selected = tabGesture.view as? UILabel else {return}

           for i in 0..<categoryMenus.count{
               categoryMenus[i].textColor = categoryMenus[i].tag == selected.tag ? #colorLiteral(red: 0.3134731054, green: 0.6144956946, blue: 1, alpha: 1) :  #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
           }
        getVlogs(categoryIdx: selected.tag)
        //self.videos = Video.smapleVideos(category: selected.tag-1)
        tableView.reloadSections(IndexSet(0...0), with: .left)

       }


}


//MARK:- methods
extension HomeViewController{
    @objc func didReceiveVlogs(_ noti:Notification){
        guard let v:vlogKey = noti.object as? vlogKey else {return}
        self.vlogs = v.Result
        self.tableView.reloadData()
    }
    @IBAction func searchToggle(_ sender:UIBarButtonItem){
        guard let leftLogo = navigationItem.leftBarButtonItem else {return}
        guard let search = navigationItem.titleView else {return} 
        leftLogo.title = leftLogo.title=="" ? "마법의 소라고동" : ""
        search.isHidden = !search.isHidden
    }
}

//MARK: TableView
extension HomeViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell:HomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.cellIdentifier) as? HomeTableViewCell else {fatalError("Unable to dequeue HomeTableViewCell")}
        let video = videos[indexPath.row]
        if video.videoId == "0"{
            cell.updateUpload(video: video)
        }else{
            cell.update(video: video)
        }
        return cell
    }
}
