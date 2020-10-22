//
//  Item.swift
//  MagicSoraGodong
//
//  Created by 이정인 on 2020/10/21.
//

import Foundation

class Item{
    let itemTitle:String?
    let itemPrice:String?
    
    init(title:String,price:String) {
        self.itemTitle = title
        self.itemPrice = price
    }
    static func initData(id:String)->[Item]{
        var items:[Item] = []
        switch id{
        case "1":
            items.append(Item(title: "뉴욕운동화", price: "30,000원"))
        case "2":
            items.append(Item(title: "무지 가디건", price: "10,000원"))
            items.append(Item(title: "스판 청바지", price: "25,000원"))
            items.append(Item(title: "스퀘어 벨트", price: "9,000원"))
        case "3":
            items.append(Item(title: "원숭이 인형", price: "90,000원"))
        case "4":
            items.append(Item(title: "어린이 로봇", price: "150,000,000원"))
        case "5":
            items.append(Item(title: "또봇 책가방", price: "30,000원"))
            
        default:
            break
        }
        return items
    }
    
    
}
