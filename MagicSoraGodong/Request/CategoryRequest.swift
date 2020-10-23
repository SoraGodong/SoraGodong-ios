//
//  CategoryRequest.swift
//  MagicSoraGodong
//
//  Created by 이정인 on 2020/10/23.
//
import Foundation



let serverURL = "http://3.35.3.76"

//서버에 데이터 요청
func dataRequest(url:String,completeHandler: @escaping (Data?,URLResponse?,Error?) -> Void){
    guard let url:URL = URL(string: url) else {return}
    let session:URLSession = URLSession(configuration: .default)
    let dataTask:URLSessionDataTask = session.dataTask(with: url, completionHandler: completeHandler)
    dataTask.resume()
    
}
func makeToken(login:LoginInfo){
    
}
func getCategory(){
    dataRequest(url: "\(serverURL)/category/1"){
        (data: Data?, reponse:URLResponse?,error:Error?) in
        if let error = error{
            print(error.localizedDescription)
            return
        }
        
        guard let data_ = data else {return}
        do{
            let apiResponse:vlogKey = try JSONDecoder().decode(vlogKey.self, from: data_)
            DispatchQueue.main.async {
                print(apiResponse)
//                NotificationCenter.default.post(name: DidReceiveMoviesNotification, object: nil, userInfo: ["movies":apiResponse.movies])
            }
        }catch(let err){
            print(err)
        }
    } 

}
