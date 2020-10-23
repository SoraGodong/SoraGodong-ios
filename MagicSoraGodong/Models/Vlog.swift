//
//  Vlog.swift
//  MagicSoraGodong
//
//  Created by 이정인 on 2020/10/23.
//

import Foundation

//MARK:- home
struct vlogKey:Codable{
    let Result:[vlogItem]
    let isSuccess:Bool
    let code:Int
    let message:String
}
struct vlogItem:Codable{
    let vlogIdx:Int
    let vlogThumbnailUrl:String
    let vlogTitle:String
    let userNickName:String
}

//MARK:- homdeDetail

struct vlogDetailKey:Codable{
    let Result:result
    let isSuccess:Bool
    let code:Int
    let message:String
}

struct vlog_:Codable{
    let vlogUrl:String
    let vlogTitle:String
    let userNickName:String
    let vlogContent:String 
    
}
struct product_:Codable{
    let productIdx:Int
    let productName:String
    let productPrice:Int
}
struct comment_:Codable{
    let commentIdx:Int
    let userIdx:Int
    let userNickName:String
    let commentContent:String
}

struct result:Codable{
    let vlog:[vlog_]
    let product:[product_]
    let comments:[comment_]
}

