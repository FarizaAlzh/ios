//
//  FavoriteCell.swift
//  BeautyList
//
//  Created by Фариза on 14.11.2026.
//

import UIKit

class FavoriteCell: UITableViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!

    func configure(with item: FavoriteItem){
        itemImageView.image = UIImage(named: item.imageName)
        titleLabel.text = item.title
        subtitleLabel.text = item.subtitle
        priceLabel.text = item.price.formatted(.number.locale(Locale(identifier: "ru_RU"))) + " \u{20B8}"
        
        let starts = [star1 ,star2, star3, star4, star5]
        for(i , star) in starts.enumerated() {
            star?.image = UIImage(systemName: i < item.rating ? "star.fill" : "star")
        }
    }
}


