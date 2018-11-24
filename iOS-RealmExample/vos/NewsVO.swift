//
//  NewsVO.swift
//  iOS-RealmExample
//
//  Created by Ye Pyae Sone Tun on 11/22/18.
//  Copyright © 2018 PrimeYZ. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class NewsVO : Object{
    
    @objc dynamic var id = UUID.init().uuidString
    
    @objc dynamic var author : String? = nil
    
    @objc dynamic var title : String? = nil
    
    @objc dynamic var desc : String? = nil
    
    @objc dynamic var url : String? = nil
    
    @objc dynamic var urlToImage : String? = nil
    
    @objc dynamic var publishedAt : String? = nil
    
    @objc dynamic var content : String? = nil
    
    convenience init(author: String, title: String, desc: String, url: String, urlToImage: String, publishedAt: String, content: String){
        self.init()
        self.author = author
        self.title = title
        self.desc = desc
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content
    }
    
    static func parseToNewsVO(_ data : JSON) -> NewsVO {
        
        let news = NewsVO()
        news.author = data["author"].string
        news.title = data["title"].string
        news.desc = data["description"].string
        news.url = data["url"].string
        news.urlToImage = data["urlToImage"].string
        news.publishedAt = data["publishedAt"].string
        news.content = data["content"].string
        return news
        
    }
}
