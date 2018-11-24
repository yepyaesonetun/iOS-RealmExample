//
//  ViewController.swift
//  iOS-RealmExample
//
//  Created by Ye Pyae Sone Tun on 11/22/18.
//  Copyright © 2018 PrimeYZ. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import RealmSwift
import SDWebImage

class ViewController: UIViewController {
    
    @IBOutlet weak var newsTableView: UITableView!
    
    var list : Results<NewsVO>!
    var news : NewsVO?
    private let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.newsTableView.separatorStyle = .none
        loadNewsAndSave()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getNewsFromDB()
    }
    
    func getNewsFromDB(){
        self.list = realm.objects(NewsVO.self)
        self.newsTableView.reloadData()
    }
    
    func loadNewsAndSave(){
        Alamofire.request("https://newsapi.org/v2/everything?q=bitcoin&from=2018-11-11&sortBy=publishedAt&apiKey=761e3bdff43144e9b74b51734d44a5f3", method: .get).responseJSON { (response) in
            
            switch response.result {
            case .success:
                let api = response.result.value
                let json = JSON(api!)
                let data = json["articles"].array
                if let result = data {
                    var list : [NewsVO] = []
                    result.forEach( { (news) in
                        try! self.realm.write {
                            list.append(NewsVO.parseToNewsVO(news))
                            self.realm.add(list)
                        }
                    })
                }
                break
            case .failure :
                print("Fail")
                break
                
            }
        }
        
    }
    
}

extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        let vo = list[indexPath.item]
        cell.ivNewsImage.sd_setImage(with:URL(string:  vo.urlToImage ?? ""),  placeholderImage : UIImage(named: "news"))
        cell.lblNewsTitle.text = vo.title
        cell.lblNewsReleasedDate.text = vo.content
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
}

extension ViewController : UITableViewDelegate {
    
}

