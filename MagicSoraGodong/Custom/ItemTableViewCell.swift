//
//  ItemTableViewCell.swift
//  MagicSoraGodong
//
//  Created by 이정인 on 2020/10/20.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemTitle:UILabel!
    @IBOutlet weak var itemPrice:UILabel!
    @IBOutlet weak var itemCnt:UILabel!
    @IBOutlet weak var itemStepper:UIStepper!
    
    static let cellIdentifier = "itemCell"
//    @IBAction func touchUpCheckBox(_ sender:UIButton){
//        sender.isSelected.toggle()
//    }
    
    @IBAction func stepperValueChanged(sender: UIStepper){
          itemCnt.text = Int(sender.value).description
      }
    override func awakeFromNib() {
        super.awakeFromNib() 
        initUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension ItemTableViewCell{
    func initUI(){
        
    }
}
