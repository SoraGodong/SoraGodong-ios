//
//  VideoInformationTableViewCell.swift
//  MagicSoraGodong
//
//  Created by uno on 2020/10/21.
//

import UIKit

class VideoInformationTableViewCell: UITableViewCell {
    
    // MARK:- Properties
    @IBOutlet weak var videoTitleField: UITextField!
    @IBOutlet weak var videoInfoField: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureTextView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

// MARK:- Configure UI
extension VideoInformationTableViewCell {
    
    func configureTextView() {
        videoInfoField.delegate = self
        videoInfoField.text = "영상 내용을 작성해주세요."
        videoInfoField.textColor = UIColor.lightGray
        videoInfoField.layer.borderWidth = 1.0
        videoInfoField.layer.borderColor = UIColor.lightGray.cgColor
        videoInfoField.layer.cornerRadius = 5
    }
    
}

// MARK:- Text View Delegate
extension VideoInformationTableViewCell: UITextViewDelegate {

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


