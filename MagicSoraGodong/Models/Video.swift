//
//  Video.swift
//  MagicSoraGodong
//
//  Created by 이정인 on 2020/10/20.
//

import Foundation

class Video: NSObject {
    let url: URL
    let thumbURL: URL
    let title: String
    let subtitle: String
    let itemtitle:String = "item"
    let profile:String = ""
    let videoId:String

      init(url: URL, thumbURL: URL, title: String, subtitle: String,id:String) {
      self.url = url
      self.thumbURL = thumbURL
      self.title = title
      self.subtitle = subtitle
      self.videoId = id
    }
    
    // MARK:- Home Category
    enum HomeCategory: Int, CaseIterable {
        
        case total = 0
        case fashion
        case interior
        case indoor
        case food
        case pet
        case furniture
        
    }
    
    static var fashion = ["Apparel",
                          "Clothing",
                          "Woman"]
    static var interior = ["China",
                           "Chandelier"]
    static var indoor = ["Coffee Jet"]
    static var food =   ["Croissants",
                         "Food",
                         "Kitchen"]
    static var pet = ["Dog",
                      "Puppy"]
    static var furniture = [ "Sofa",
                             "Armchair",
                             "Chromakey"]
    
    
    class func smapleVideos(category:Int=0) -> [Video] {
        let vlogs = [fashion+interior+indoor+food+pet+furniture,
                     fashion,
                     interior,
                     indoor,
                     food,
                     pet,
                     furniture]
        let titles = vlogs[category]
        var videos: [Video] = []
        for (index, name) in titles.enumerated() {
          let urlPath = Bundle.main.path(forResource: name, ofType: "mp4")!
          let url = URL(fileURLWithPath: urlPath)
          let thumbURLPath = Bundle.main.path(forResource: name, ofType: "png")!
          let thumbURL = URL(fileURLWithPath: thumbURLPath)
          
            let video = Video(url: url, thumbURL: thumbURL, title: titles[index], subtitle: titles[index],id : "\(index)")
          videos.append(video)
        }
        return videos
    }
    
    class func localVideos() -> [Video] {
      var videos: [Video] = []
      let names = ["newYorkFlip", "bulletTrain", "monkey", "shark"]
      let videoId = ["1","2","3","4","5"]
      let titles = ["New York Flip", "Bullet Train Adventure", "Monkey Village", "Robot Battles"]
      let subtitles = ["뉴요커 운동화",
                       "기차 여행 착장",
                       "원숭이 인형",
                       "로봇"]
      
      for (index, name) in names.enumerated() {
        let urlPath = Bundle.main.path(forResource: name, ofType: "mp4")!
        let url = URL(fileURLWithPath: urlPath)
        let thumbURLPath = Bundle.main.path(forResource: name, ofType: "png")!
        let thumbURL = URL(fileURLWithPath: thumbURLPath)
        
          let video = Video(url: url, thumbURL: thumbURL, title: titles[index], subtitle: subtitles[index],id : videoId[index])
        videos.append(video)
      }
      return videos
    }
    
    
    class func allVideos() -> [Video] {
      var videos = localVideos()
      
      // Add one remote video
      let videoURLString = "https://wolverine.raywenderlich.com/content/ios/tutorials/video_streaming/foxVillage.m3u8"
      if let url = URL(string: videoURLString) {
        let thumbURLPath = Bundle.main.path(forResource: "foxVillage", ofType: "png")!
        let thumbURL = URL(fileURLWithPath: thumbURLPath)
          let remoteVideo = Video(url: url, thumbURL: thumbURL, title: "キツネ村", subtitle: "아동 책가방",id:"5")
        videos.append(remoteVideo)
      }
      
      return videos
    }
}
