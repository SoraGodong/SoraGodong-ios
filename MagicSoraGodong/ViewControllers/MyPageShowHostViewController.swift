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
        guard let cell:HomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.cellIdentifier) as? HomeTableViewCell else {fatalError("Unable to dequeue HomeTableViewCell")}
        let video = videos[indexPath.row]
        cell.update(video: video)
        return cell
    }
    
    
}

extension MyPageShowHostViewController: UITableViewDelegate {
    
}


