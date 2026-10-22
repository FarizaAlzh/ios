//
//  ViewController.swift
//  Yumix
//
//  Created by Фариза on 16.10.2026.
//

import UIKit

struct Favorite {
    let imageName: String
    let title: String
    let description: String
}

class ViewController: UIViewController {
    @IBOutlet weak var dairyImageView: UIImageView!
    @IBOutlet weak var dairyTitleLabel: UILabel!
    @IBOutlet weak var dairyDescriptionLabel: UILabel!
    
    @IBOutlet weak var fruitsImageView: UIImageView!
    @IBOutlet weak var fruitTitleLabel: UILabel!
    @IBOutlet weak var fruitDescriptionLabel: UILabel!
    
    @IBOutlet weak var vegetablesImageView: UIImageView!
    @IBOutlet weak var vegTitleLabel: UILabel!
    @IBOutlet weak var vegDescriptionLabel: UILabel!
    
    let dairy: [Favorite] = [
        Favorite(imageName: "cheese", title: "cheese", description: "350 kcal"),
        Favorite(imageName: "cottage_cheese", title: "cottage cheese", description: "100 kcal"),
        Favorite(imageName: "sour cream", title: "sour cream", description: "200 kcal")
    ]

    let fruits: [Favorite] = [
        Favorite(imageName: "banana", title: "banana", description: "105 kcal"),
        Favorite(imageName: "apple", title: "apple", description: "95 kcal"),
        Favorite(imageName: "pear", title: "pear", description: "100 kcal"),
        Favorite(imageName: "peach", title: "peach", description: "60 kcal")
    ]

    let vegetables: [Favorite] = [
        Favorite(imageName: "cabbage", title: "cabbage", description: "25 kcal"),
        Favorite(imageName: "pepper", title: "pepper", description: "30 kcal"),
        Favorite(imageName: "tomato", title: "tomato", description: "22 kcal")
    ]
    
    var lastDairyTitle: String?
    var lastFruitTitle: String?
    var lastVegTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let item = dairy.first {
            show(item, image: dairyImageView, title: dairyTitleLabel, description: dairyDescriptionLabel)
            lastDairyTitle = item.title
        }
        
        if let item = fruits.first{
            show(item, image: fruitsImageView, title: fruitTitleLabel, description: fruitDescriptionLabel)
            lastFruitTitle = item.title
        }
        
        if let item = vegetables.first{
            show(item, image: vegetablesImageView, title: vegTitleLabel, description: vegDescriptionLabel)
            lastVegTitle = item.title
        }
    }

    @IBAction func showRandomTapped(_ sender: UIButton) {
        if let item = randomItem(in: dairy, excluding: lastDairyTitle) {
            lastDairyTitle = item.title
            show(item, image: dairyImageView, title: dairyTitleLabel, description: dairyDescriptionLabel)
        }
        if let item = randomItem(in: fruits, excluding: lastFruitTitle) {
            lastFruitTitle = item.title
            show(item, image: fruitsImageView, title: fruitTitleLabel, description: fruitDescriptionLabel)
        }
        if let item = randomItem(in: vegetables, excluding: lastVegTitle) {
            lastVegTitle = item.title
            show(item, image: vegetablesImageView, title: vegTitleLabel, description: vegDescriptionLabel)
        }
    }

    func randomItem(in items: [Favorite], excluding lastTitle: String?) -> Favorite? {
        let candidates = items.filter { $0.title != lastTitle }
        return candidates.randomElement() ?? items.first
    }

    func show(_ item: Favorite, image: UIImageView, title: UILabel, description: UILabel) {
        image.image = UIImage(named: item.imageName)
        title.text = item.title
        description.text = item.description
    }
}
    

