//
//  Comment.swift
//  MagicSoraGodong
//
//  Created by 이정인 on 2020/10/21.
//

import Foundation

class Comment{
    let userId:String
    let content:String
    let date:String
    
    init(id:String,content:String,date:String) {
        self.userId = id
        self.content = content
        self.date = date
    }
    
    static func initData()->[Comment]{
        var comments:[Comment] = []
        comments.append(Comment(id: "사회악물리학", content: "와 정말 갖고 싶다", date: "3분전"))
        comments.append(Comment(id: "조선왕조실룩샐룩", content: "이건 사야돼", date: "1시간전"))
        comments.append(Comment(id: "이게뭐하는거지", content: "이건 못 참지", date: "5시간전"))
        comments.append(Comment(id: "아리와나그란데", content: "ㅋㅋㅋㅋㅋㅋㅋㅋ", date: "3일전"))
        return comments
    }
}
