//
//  DetailViewController.swift
//  BeautyList
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet var starImageViews: [UIImageView]!

    var product: Product?

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let product = product else { return }

        title = product.title
        itemImageView.image = UIImage(named: product.imageName)
        titleLabel.text = product.title
        subtitleLabel.text = product.subtitle
        priceLabel.text = product.price.formatted() + " ₸"
        descriptionLabel.text = product.description

        for (index, star) in starImageViews.enumerated() {
            star.image = UIImage(systemName: index < product.rating ? "star.fill" : "star")
        }
    }
}
