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
        for _ in 0..<5{
            comments.append(Comment(id: "사회악물리학", content: "와 정말 갖고 싶다", date: "3분전"))
        }
        return comments
    }
}
