//
//  LoginToken.swift
//  MagicSoraGodong
//
//  Created by 이정인 on 2020/10/23.
//

import Foundation
struct TokenKey:Codable{
    let result:LoginToken
    let isSuccess:String
    let code:String
    let message:String
}
struct LoginToken:Codable {
    let jwt:String
}
