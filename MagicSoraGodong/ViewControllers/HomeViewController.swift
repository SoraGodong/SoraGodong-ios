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
    var videos:[vlogItem] = []
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        makeCategoryMenu()
        initUI()
        NotificationCenter.default.addObserver(self, selector: #selector(self.didReceiveVlogs), name: DidReceiveVlogsNotification, object: nil)
        
        getVlogs()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let homeDetailViewController:HomeDetailViewController = segue.destination as? HomeDetailViewController else {return}
        guard let selectedIndexPath = self.tableView.indexPathForSelectedRow else {return}
        homeDetailViewController.vlogIdx = videos[selectedIndexPath.row].vlogIdx
    }
}

// MARK:- Configure
extension HomeViewController{
    
    func initUI(){
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    func makeCategoryMenu(){
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
            
            
            let categoryTab:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.touchUpCategory(_:)))
            categoryMenu.addGestureRecognizer(categoryTab)
            categoryMenus.append(categoryMenu)
            scrollView.contentSize.width = self.view.frame.width*1.5
            scrollView.showsHorizontalScrollIndicator = false
            scrollView.addSubview(categoryMenu)
        }
    }
    
    //카테고리 클릭했을때 처리
       @objc func touchUpCategory(_ sender:UIGestureRecognizer){
           guard let tabGesture = sender as? UITapGestureRecognizer else {return}
           guard let selected = tabGesture.view as? UILabel else {return}

           for i in 0..<categoryMenus.count{
               categoryMenus[i].textColor = categoryMenus[i].tag == selected.tag ? #colorLiteral(red: 0.3134731054, green: 0.6144956946, blue: 1, alpha: 1) :  #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
           }
        getVlogs(categoryIdx: selected.tag)
        tableView.reloadSections(IndexSet(0...0), with: .left)

       }


}


//MARK:- methods
extension HomeViewController{
    @objc func didReceiveVlogs(_ noti:Notification){
        guard let v:vlogKey = noti.object as? vlogKey else {return}
        self.videos = v.Result
        self.tableView.reloadData()
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
        cell.update(video: video)
        return cell
    }
}
