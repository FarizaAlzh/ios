//
//  CategoryCell.swift
//  BeautyList
//
//  Created by Фариза on 14.11.2026.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    
    func configure(with category: Category){
        itemImageView.image = UIImage(named: category.imageName)
        titleLabel.text = category.name
    }

}


