//
//  CategoryRequest.swift
//  MagicSoraGodong
//
//  Created by 이정인 on 2020/10/23.
//
import Foundation

//MARK:- notifications
let DidReceiveVlogsNotification:Notification.Name = Notification.Name("DidReceiveVlogs")
let DidReceiveVlogNotification:Notification.Name = Notification.Name("DidReceiveVlog")

//MARK:-property
let serverURL = "http://3.35.3.76"


//MARK:-method

//서버에 데이터 요청
func dataRequest(url:String,completeHandler: @escaping (Data?,URLResponse?,Error?) -> Void){
    guard let url:URL = URL(string: url) else {return}
    let session:URLSession = URLSession(configuration: .default)
    let dataTask:URLSessionDataTask = session.dataTask(with: url, completionHandler: completeHandler)
    dataTask.resume()
    
}
func makeToken(login:LoginInfo){
    
}

//카테고리별 브이로그 데이터 가져오기
func getVlogs(categoryIdx:Int = 1){
    dataRequest(url: "\(serverURL)/category/\(categoryIdx)"){
        (data: Data?, reponse:URLResponse?,error:Error?) in
        if let error = error{
            print(error.localizedDescription)
            return
        }
        guard let data_ = data else {return}
       
        do{
            let apiResponse:vlogKey = try JSONDecoder().decode(vlogKey.self, from: data_)
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: DidReceiveVlogsNotification, object: apiResponse)
            }
        }catch(let err){
            print(err)
        }
    }
}


//브이로그 데이터 가져오기
func getVlog(vlogIdx:Int){ 
    dataRequest(url: "\(serverURL)/vlog/\(vlogIdx)"){
        (data: Data?, reponse:URLResponse?,error:Error?) in
        if let error = error{
            print(error.localizedDescription)
            return
        }
        guard let data_ = data else {return}
       
        do{ 
            let apiResponse:vlogDetailKey = try JSONDecoder().decode(vlogDetailKey.self, from: data_)
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: DidReceiveVlogNotification, object: apiResponse)
            }
        }catch(let err){
            print(err)
        }
    }
}
