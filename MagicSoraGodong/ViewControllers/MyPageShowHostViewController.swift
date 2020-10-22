//
//  MyPageShowHostViewController.swift
//  MagicSoraGodong
//
//  Created by hiju on 2020/10/22.
//

import UIKit

class MyPageShowHostViewController: UIViewController {

    //MARK: Properties

    @IBOutlet weak var showhostTableView: UITableView!
    
    var videos: [Video] = Video.allVideos()
    
    //MARK: Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showhostTableView.dataSource = self
        showhostTableView.delegate = self
        showhostTableView.separatorStyle = .none
        showhostTableView.tableFooterView = UIView()
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let homeDetailViewController:HomeDetailViewController = segue.destination as? HomeDetailViewController else {return}
//        guard let selectedIndexPath = self.tableView.indexPathForSelectedRow else {return}
//        homeDetailViewController.video = videos[selectedIndexPath.row]
//    }

}


//MARK: - TableView

extension MyPageShowHostViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "RevenueTableViewCell", for: indexPath) as? RevenueTableViewCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyPageMyVideoTableViewCell", for: indexPath) as? MyPageMyVideoTableViewCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyPageAllOfVideosTableViewCell") as? MyPageAllOfVideosTableViewCell else { return UITableViewCell() }
            let video = videos[indexPath.row-2]
            cell.update(video: video)
            return cell
        }
        
    }
    
    
}

extension MyPageShowHostViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 390
        case 1:
            return 90
        default:
            return 260
        }
    }
}


