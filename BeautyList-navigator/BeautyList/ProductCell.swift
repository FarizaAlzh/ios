//
//  ProductCell.swift
//  BeautyList
//
//  Created by Фариза on 20.11.2026.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    func configure(with product: Product) {
        itemImageView.image = UIImage(named: product.imageName)
        titleLabel.text = product.title
    }
}
