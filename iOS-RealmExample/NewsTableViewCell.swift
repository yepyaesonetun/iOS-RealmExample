//
//  NewsTableViewCell.swift
//  iOS-RealmExample
//
//  Created by Ye Pyae Sone Tun on 11/22/18.
//  Copyright © 2018 PrimeYZ. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak internal var ivNewsImage: UIImageView!
    
    @IBOutlet weak internal var lblNewsTitle: UILabel!
    
    @IBOutlet weak internal var lblNewsReleasedDate: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
